defmodule BuildkiteEx do
  def list_organizations(client) do
    Tesla.get(client, "/organizations")
  end

  def get_organization(client, organization_slug) do
    Tesla.get(client, "/organizations/#{organization_slug}")
  end
end
