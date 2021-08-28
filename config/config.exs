use Mix.Config

if Mix.env() == :test, do: config(:tesla, adapter: Tesla.Mock)

config :buildkite_ex, api_token: System.get_env("BUILDKITE_API_TOKEN")
