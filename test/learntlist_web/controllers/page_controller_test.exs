defmodule LearntlistWeb.PageControllerTest do
  use LearntlistWeb.ConnCase

  describe "GET /" do
    test "lists all learnt_items", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "learntlist"
    end
  end
end
