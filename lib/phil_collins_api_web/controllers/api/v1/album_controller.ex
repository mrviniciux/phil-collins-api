defmodule PhilCollinsApiWeb.Api.V1.AlbumController do
  use PhilCollinsApiWeb, :controller
  alias PhilCollinsApi.Api.V1.Album
  alias PhilCollinsApi.Repo

  def index(conn, _params) do
    render(conn, :index, albums: Repo.all(Album))
  end
end
