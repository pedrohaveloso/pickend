defmodule PickendWeb.TransferController do
  use PickendWeb, :controller

  def transfer(conn) do
    send_resp(conn, 200, Jason.encode!(%{status: true}))
  end
end
