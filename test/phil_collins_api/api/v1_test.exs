defmodule PhilCollinsApi.Api.V1Test do
  use PhilCollinsApi.DataCase

  alias PhilCollinsApi.Api.V1

  describe "albums" do
    alias PhilCollinsApi.Api.V1.Album

    import PhilCollinsApi.Api.V1Fixtures

    @invalid_attrs %{title: nil, image: nil, release_date: nil, is_lp: nil}

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert V1.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert V1.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      valid_attrs = %{
        title: "some title",
        image: "some image",
        release_date: ~D[2024-01-12],
        is_lp: true
      }

      assert {:ok, %Album{} = album} = V1.create_album(valid_attrs)
      assert album.title == "some title"
      assert album.image == "some image"
      assert album.release_date == ~D[2024-01-12]
      assert album.is_lp == true
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = V1.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()

      update_attrs = %{
        title: "some updated title",
        image: "some updated image",
        release_date: ~D[2024-01-13],
        is_lp: false
      }

      assert {:ok, %Album{} = album} = V1.update_album(album, update_attrs)
      assert album.title == "some updated title"
      assert album.image == "some updated image"
      assert album.release_date == ~D[2024-01-13]
      assert album.is_lp == false
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = V1.update_album(album, @invalid_attrs)
      assert album == V1.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = V1.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> V1.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = V1.change_album(album)
    end
  end
end
