defmodule PhilCollinsApiWeb.AlbumControllerTest do
  use PhilCollinsApiWeb.ConnCase

  setup %{conn: conn} do
    albums = insert_list(10, :album)

    {:ok, conn: put_req_header(conn, "accept", "application/json"), albums: albums}
  end

  describe "index" do
    test "list all albums", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/albums")

      assert json_response(conn, 200)
      assert length(json_response(conn, 200)["data"]) == 10
    end
  end
end
