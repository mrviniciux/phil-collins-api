defmodule PhilCollinsApi.AlbumsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhilCollinsApi.Albums` context.
  """

  @doc """
  Generate a album.
  """
  def album_fixture(attrs \\ %{}) do
    {:ok, album} =
      attrs
      |> Enum.into(%{
        image: "some image",
        is_lp: true,
        release_date: ~D[2024-01-19],
        title: "some title"
      })
      |> PhilCollinsApi.Albums.create_album()

    album
  end
end
