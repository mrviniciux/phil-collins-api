defmodule Support.Factory do
  use ExMachina.Ecto, repo: PhilCollinsApi.Repo

  alias PhilCollinsApi.Albums.Album

  def album_factory do
    %Album{
      title: "No Jacket Required",
      release_date: ~D[1985-02-18],
      is_lp: true,
      image: "no_jacket_required.jpg"
    }
  end
end
