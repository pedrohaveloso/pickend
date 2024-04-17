defmodule Pickend.Accounts.Session do
  use Pickend, :schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: []}

  schema "sessions" do
    field(:active?, :boolean)
    field(:user, :binary_id)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
  end
end
