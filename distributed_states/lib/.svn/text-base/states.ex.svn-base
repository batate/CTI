defmodule States do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, videos) do 
    States.Supervisor.start_link(videos)
  end
end
