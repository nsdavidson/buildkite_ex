defmodule BuildkiteEx.AccessToken do
  def get_current(client) do
    Tesla.get(client, "access-token")
  end
end
