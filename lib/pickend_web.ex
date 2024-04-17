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

      def read_json_body(conn) do
        case read_body(conn) do
          {:ok, body, conn} ->
            {:ok, Jason.decode!(body), conn}

          _ ->
            {:error, "Incorrect body."}
        end
      end

      def send_json_resp(conn, status, body) do
        send_resp(conn, status, Jason.encode!(body))
      end
    end
  end
end
