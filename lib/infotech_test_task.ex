defmodule InfotechTestTask do
  use Application
  use N2O

  def start(_start_type, _start_args) do
    initialize_app()
    Supervisor.start_link([], strategy: :one_for_one, name: InfotechTestTask.Supervisor)
  end


  def initialize_app() do
    :cowboy.start_clear(
      :http,
      [{:port, :application.get_env(:n2o, :port, 8080)}],
      %{env: %{dispatch: :n2o_cowboy.points()}}
    )
  end
end
