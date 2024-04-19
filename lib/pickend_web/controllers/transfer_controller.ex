defmodule PickendWeb.TransferController do
  use PickendWeb, :controller

  alias Pickend.{Financial, Accounts}

  def create(conn) do
    case read_json_body(conn) do
      {:ok, body, _conn} ->
        create(conn, body)

      {:error, reason} ->
        send_json_resp(conn, 400, %{"reason" => reason})
    end
  end

  def create(conn, body) do
    with {:ok, struct} <- Financial.create_transfer(body),
         {:ok, _} <-
           Accounts.update_user_money(
             body["payee"],
             String.to_integer(body["amount"]),
             :add
           ),
         {:ok, _} <-
           Accounts.update_user_money(
             body["payer"],
             String.to_integer(body["amount"]),
             :remove
           ) do
      send_json_resp(conn, 200, struct)
    else
      {:error, _} ->
        send_json_resp(conn, 400, %{"reason" => "invalid data"})
    end
  end
end
