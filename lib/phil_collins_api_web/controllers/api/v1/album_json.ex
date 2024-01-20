defmodule PhilCollinsApiWeb.Api.V1.AlbumJSON do
  alias PhilCollinsApi.Api.V1.Album

  defp data(%Album{} = album) do
    %{
      title: album.title,
      image: album.image,
      release_date: album.release_date,
      is_lp: album.is_lp
    }
  end

  @doc """
  Renders a list of albums.
  """
  def index(%{albums: albums}) do
    %{data: for(album <- albums, do: data(album))}
  end
end
