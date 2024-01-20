defmodule PhilCollinsApiWeb.AlbumController do
  use PhilCollinsApiWeb, :controller
  alias PhilCollinsApi.Albums.Album
  alias PhilCollinsApi.Repo

  def index(conn, _params) do
    render(conn, :index, albums: Repo.all(Album))
  end
end
