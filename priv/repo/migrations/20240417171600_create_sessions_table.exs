defmodule Pickend.Repo.Migrations.CreateSessionTable do
  use Ecto.Migration

  def change() do
    create table("sessions", primary_key: false) do
      add(:id, :binary_id, primary_key: true)

      add(:active?, :boolean)

      add(:user, references("users", type: :binary_id))

      timestamps()
    end
  end
end
