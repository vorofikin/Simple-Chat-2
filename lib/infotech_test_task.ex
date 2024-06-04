defmodule InfotechTestTask do
  use Application
  use N2O

  def start(_start_type, _start_args) do
    initialize_app()
    Supervisor.start_link([], strategy: :one_for_one, name: InfotechTestTask.Supervisor)
  end


  def initialize_app() do
    IO.inspect :cowboy.start_clear(
      :http,
      :application.get_env(:n2o_cowboy, :port, 8080),
      %{env: %{
        dispatch: :n2o_cowboy.points
        }
      }
    )
  end
end
