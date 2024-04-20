defmodule PickendWeb.Router do
  use PickendWeb, :router

  alias PickendWeb.{SessionController, UserController, TransferController}

  post("/users", do: UserController.create(conn))

  post("/sessions", do: SessionController.create(conn))
  patch("/sessions/:id", do: SessionController.disable(conn))

  post("/transfers", do: TransferController.create(conn))

  match(_, do: send_resp(conn, 404, ""))
end
