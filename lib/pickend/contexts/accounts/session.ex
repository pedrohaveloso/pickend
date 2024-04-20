defmodule Pickend.Accounts.Session do
  use Pickend, :schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :ip, :active?, :user]}

  schema "sessions" do
    field(:active?, :boolean, default: true)
    field(:ip, :string)
    field(:user, Ecto.UUID)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:active?, :ip, :user])
    |> validate_required([:ip, :user])
  end
end
