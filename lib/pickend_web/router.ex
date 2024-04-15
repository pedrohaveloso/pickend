defmodule PickendWeb.Router do
  use PickendWeb, :router

  alias PickendWeb.UserController
  alias PickendWeb.TransferController

  post("/user", do: UserController.create(conn))

  post("/transfer", do: TransferController.transfer(conn))

  match("/", do: send_resp(conn, 404, "Not found"))
end
