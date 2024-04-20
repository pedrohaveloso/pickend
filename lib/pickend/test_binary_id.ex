defmodule Pickend.TestBinaryId do
  use Pickend, :schema

  import Ecto.Changeset

  alias Pickend.TestBinaryId

  embedded_schema do
    field(:test_uuid, Ecto.UUID)
  end

  def valid?(uuid) do
    %TestBinaryId{}
    |> cast(%{test_uuid: uuid}, [:test_uuid])
    |> Map.from_struct()
    |> Map.get(:valid?)
  end
end
