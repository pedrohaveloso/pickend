defmodule PickendWeb.Router do
  use PickendWeb, :router

  alias PickendWeb.UserController
  alias PickendWeb.TransferController

  post("/users", do: UserController.create(conn))

  post("/transfers", do: TransferController.transfer(conn))

  match(_, do: send_resp(conn, 404, ""))
end
