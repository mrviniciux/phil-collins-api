defmodule PhilCollinsApiWeb.AlbumControllerTest do
  use PhilCollinsApiWeb.ConnCase


  describe "index" do
    test "list all albums", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/albums")

      assert json_response(conn, 200)
      assert length(json_response(conn, 200)["data"]) == 0
    end

  end
end
