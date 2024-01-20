defmodule PhilCollinsApi.Api.V1Fixtures do
  alias PhilCollinsApi.Api.V1
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhilCollinsApi.Api.V1` context.
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
        release_date: ~D[2024-01-12],
        title: "some title"
      })
      |> V1.create_album()

    album
  end
end
