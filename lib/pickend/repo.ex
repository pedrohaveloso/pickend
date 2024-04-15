defmodule Pickend.Repo do
  use Ecto.Repo,
    otp_app: :pickend,
    adapter: Ecto.Adapters.Postgres
end
