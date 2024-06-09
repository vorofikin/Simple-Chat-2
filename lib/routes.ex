defmodule Routes do
  require N2O;

  def finist(state, context), do: {:ok, state, context}

  def init(state, context) do
    %{path: path} = N2O.cx(context, :req)
    {:ok, state, N2O.cx(context, path: path, module: route_prefix(path))}
  end

  defp route_prefix(<<"/ws/", p::binary>>), do: route(p)
  defp route_prefix(<<"/", p::binary>>), do: route(p)
  defp route_prefix(path), do: route(path)

  defp route(<<>>), do: Index
  defp route(<<"index", _::binary>>), do: Index
  defp route(<<"room", _::binary>>), do: Room
  defp route(<<"app/index", _::binary>>), do: Index
  defp route(<<"app/room", _::binary>>), do: Room
  defp route(_), do: Index
end
