defmodule Pickend do
  defmacro __using__(using) when is_atom(using) do
    apply(__MODULE__, using, [])
  end

  def schema() do
    quote do
      use Ecto.Schema

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end
end
