defmodule Pickend.Repo.Migrations.CreateTransfersTable do
  use Ecto.Migration

  def change() do
    create table("transfers", primary_key: false) do
      add(:id, :binary_id, primary_key: true)

      add(:amount, :integer)

      add(:payer, references("users", type: :binary_id))
      add(:payee, references("users", type: :binary_id))

      timestamps()
    end
  end
end
