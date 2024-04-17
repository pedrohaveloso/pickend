defmodule Pickend.Accounts.User do
  use Pickend, :schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :full_name, :document, :email, :money, :type]}

  schema "users" do
    field(:full_name, :string)
    field(:document, :string)
    field(:email, :string)
    field(:password, :string, redact: true)
    field(:money, :integer)
    field(:type, Ecto.Enum, values: [common: 1, merchant: 2])

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :document, :email, :password, :money, :type])
    |> validate_required([:full_name, :document, :email, :password, :type])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:full_name, min: 10, max: 155)
    |> unique_constraint([:email, :document])
  end
end
