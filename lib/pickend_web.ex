defmodule PickendWeb do
  defmacro __using__(using) when is_atom(using) do
    apply(__MODULE__, using, [])
  end

  def router() do
    quote do
      use Plug.Router

      plug(:match)
      plug(:dispatch)
    end
  end

  def controller() do
    quote do
      import Plug.Conn
    end
  end
end
