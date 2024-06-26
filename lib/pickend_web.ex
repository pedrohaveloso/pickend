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
        with {:ok, body, conn} <- read_body(conn),
             {:ok, body} <- Jason.decode(body) do
          {:ok, body, conn}
        else
          {:more, _, _} ->
            {:error, "too much data to read"}

          _ ->
            {:error, "invalid body"}
        end
      end

      def send_json_resp(conn, status, body) do
        if {:ok, encoded} = Jason.encode(body) do
          send_resp(conn, status, encoded)
        else
          send_resp(conn, 500, "")
        end
      end

      def show_errors(changeset) do
        Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
          Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
            opts
            |> Keyword.get(String.to_existing_atom(key), key)
            |> to_string()
          end)
        end)
      end
    end
  end
end
