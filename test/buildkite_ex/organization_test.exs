defmodule OrganizationTest do
  use ExUnit.Case

  alias BuildkiteEx.Organization

  setup do
    Tesla.Mock.mock(fn env -> get_mock(env) end)

    [client: BuildkiteEx.Client.new("token")]
  end

  test "get organization", %{client: client} do
    assert {:ok, resp} = Organization.get(client, "my-org")
    assert resp.status == 200
    assert Map.get(resp.body, "slug") == "my-org"
  end

  test "list organizations", %{client: client} do
    assert {:ok, resp} = Organization.list(client)
    assert resp.status == 200
    assert length(resp.body) == 1
    org = resp.body |> List.first()
    assert Map.get(org, "slug") == "my-org"
  end

  defp get_mock(%{method: :get, url: "https://api.buildkite.com/v2/organizations/my-org"}) do
    %Tesla.Env{
      status: 200,
      body: %{
        "agents_url" => "https://api.buildkite.com/v2/organizations/my-org/agents",
        "created_at" => "2021-04-06T19:02:04.088Z",
        "emojis_url" => "https://api.buildkite.com/v2/organizations/my-org/emojis",
        "graphql_id" => "T3JnYW5pemF0aW9uLS0tOWQ1NTU3MzgtMjNlNy00ZGJjLWIzMWItMDBmYTUwOGU1MmU5",
        "id" => "9d555738-23e7-4dbc-b31b-00fa508e52e9",
        "name" => "Articulate, Inc.",
        "pipelines_url" => "https://api.buildkite.com/v2/organizations/my-org/pipelines",
        "slug" => "my-org",
        "url" => "https://api.buildkite.com/v2/organizations/my-org",
        "web_url" => "https://buildkite.com/my-org"
      }
    }
  end

  defp get_mock(%{method: :get, url: "https://api.buildkite.com/v2/organizations"}) do
    %Tesla.Env{
      status: 200,
      body: [
        %{
          "agents_url" => "https://api.buildkite.com/v2/organizations/my-org/agents",
          "created_at" => "2021-04-06T19:02:04.088Z",
          "emojis_url" => "https://api.buildkite.com/v2/organizations/my-org/emojis",
          "graphql_id" => "T3JnYW5pemF0aW9uLS0tOWQ1NTU3MzgtMjNlNy00ZGJjLWIzMWItMDBmYTUwOGU1MmU5",
          "id" => "9d555738-23e7-4dbc-b31b-00fa508e52e9",
          "name" => "Articulate, Inc.",
          "pipelines_url" => "https://api.buildkite.com/v2/organizations/my-org/pipelines",
          "slug" => "my-org",
          "url" => "https://api.buildkite.com/v2/organizations/my-org",
          "web_url" => "https://buildkite.com/my-org"
        }
      ]
    }
  end
end
