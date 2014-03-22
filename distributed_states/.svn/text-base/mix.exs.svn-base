defmodule States.Mixfile do
  use Mix.Project

  def project do
    [ app: :states,
      version: "0.0.1",
      elixir: "~> 0.11.0",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ registered: [:video_store],
      mod: { States, [] } ]
  end
  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    []
  end
end
