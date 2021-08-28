defmodule BuildkiteEx.Organization do
  @doc """
  List organizations

  ### Example

     BuildkiteEx.Organization.list(client)
  """
  def list(client) do
    Tesla.get(client, "/organizations")
  end

  @doc """
  Get an organization by slug

  ### Example

     BuildkiteEx.Organization.get(client, slug)
  """
  def get(client, organization_slug) do
    Tesla.get(client, "/organizations/#{organization_slug}")
  end
end
