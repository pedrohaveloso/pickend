defmodule Pickend.Financial.Transfer do
  use Pickend, :schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :amount, :payer, :payee]}

  schema "transfers" do
    field(:amount, :integer)

    field(:payer, :binary_id)
    field(:payee, :binary_id)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount, :payer, :payee])
    |> validate_required([:amount, :payer, :payee])
  end
end
