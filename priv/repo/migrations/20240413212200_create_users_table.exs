defmodule Pickend.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change() do
    create table("users", primary_key: false) do
      add(:id, :binary_id, primary_key: true)

      add(:full_name, :string)
      add(:document, :string)
      add(:email, :string)
      add(:password, :string)
      add(:money, :integer)
      add(:type, :integer)

      timestamps()
    end

    create(unique_index("users", [:document, :email]))
  end
end
