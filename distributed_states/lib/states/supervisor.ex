defmodule States.Supervisor do
  use Supervisor.Behaviour

  def start_link(videos) do
    :supervisor.start_link(__MODULE__, videos)
  end

  def init(videos) do
    children = [ worker(States.Server, [videos]) ]
    supervise(children, strategy: :one_for_one)
  end
end
