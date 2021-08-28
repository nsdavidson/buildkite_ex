defmodule BuildkiteEx.Client do
  use Tesla

  def new(api_token \\ get_token()) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.buildkite.com/v2"},
      {Tesla.Middleware.BearerAuth, token: api_token},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middleware)
  end

  def get_token() do
    Application.get_env(:buildkite_ex, :api_token)
  end
end
