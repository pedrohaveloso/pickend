defmodule PickendWeb.UserController do
  use PickendWeb, :controller

  alias Pickend.Accounts

  def create(conn) do
    case read_json_body(conn) do
      {:ok, body} ->
        email = if is_nil(body["email"]), do: "", else: body["email"]
        document = if is_nil(body["document"]), do: "", else: body["document"]

        {status, body} =
          with nil <- Accounts.get_user(email: email),
               nil <- Accounts.get_user(document: document),
               {:ok, struct} <- Accounts.create_user(body) do
            {200, struct}
          else
            %Accounts.User{} ->
              {404, %{reason: "User e-mail/document already exists."}}

            {:error, changeset} ->
              {404,
               %{
                 reason: "Invalid data.",
                 errors:
                   Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
                     Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
                       opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
                     end)
                   end)
               }}
          end

        send_json_resp(conn, status, body)

      _ ->
        send_json_resp(conn, 400, %{reason: "Incorrect body."})
    end
  end
end
