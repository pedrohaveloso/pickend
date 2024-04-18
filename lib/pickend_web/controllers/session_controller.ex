defmodule PickendWeb.SessionController do
  use PickendWeb, :controller

  alias Pickend.Accounts

  def create(conn) do
    case read_json_body(conn) do
      {:ok, body, _conn} ->
        create(conn, body)

      {:error, reason} ->
        send_json_resp(conn, 400, %{"reason" => reason})
    end
  end

  defp create(conn, body) do
    with user <- body["user"],
         _ <- Accounts.get_user(id: user),
         {:ok, struct} <- Accounts.create_session(body) do
      send_json_resp(conn, 200, struct)
    else
      nil ->
        send_json_resp(conn, 400, %{"reason" => "user doens't exists"})

      {:error, changeset} ->
        send_json_resp(conn, 400, %{
          "reason" => "invalid data",
          "errors" => show_errors(changeset)
        })
    end
  end
end
