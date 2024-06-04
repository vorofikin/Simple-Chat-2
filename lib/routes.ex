defmodule Routes do
  require N2O

  def finist(state, context), do: {:ok, state, context}

  def init(state, context) do
    %{path: path} = N2O.cx(context, :req)
    {:ok, state, N2O.cx(context, path: path, module: route_prefix(path))}
  end

  defp route_prefix(<<"/ws/", p::binary>>), do: route(p)
  defp route_prefix(<<"/", p::binary>>), do: route(p)
  defp route_prefix(path), do: route(path)

  defp route(<<>>), do: InfotechTestTask.Index
  defp route(<<"index", _::binary>>), do: InfotechTestTask.Index
  defp route(<<"login", _::binary>>), do: Sample.Login
  defp route(<<"app/index", _::binary>>), do: Sample.Index
  defp route(<<"app/login", _::binary>>), do: Sample.Login
  defp route(_), do: Sample.Login
end
