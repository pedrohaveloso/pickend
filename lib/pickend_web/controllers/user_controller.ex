defmodule PickendWeb.UserController do
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
    {status, body} =
      with email <- body["email"],
           document <- body["document"],
           nil <- Accounts.get_user(email: email),
           nil <- Accounts.get_user(document: document),
           {:ok, struct} <- Accounts.create_user(body) do
        {200, struct}
      else
        nil ->
          {404, %{"reason" => 'invalid e-mail/document'}}

        %Accounts.User{} ->
          {404, %{"reason" => "user e-mail/document already exists"}}

        {:error, changeset} ->
          {404,
           %{
             "reason" => "invalid data",
             "errors" => show_errors(changeset)
           }}
      end

    send_json_resp(conn, status, body)
  end
end
