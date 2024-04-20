defmodule Pickend.Financial.Transfer do
  use Pickend, :schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :amount, :payer, :payee]}

  schema "transfers" do
    field(:amount, :integer)

    field(:payer, Ecto.UUID)
    field(:payee, Ecto.UUID)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount, :payer, :payee])
    |> validate_required([:amount, :payer, :payee])
  end
end
