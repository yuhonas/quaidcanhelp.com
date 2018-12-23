defmodule LearntlistWeb.PageControllerTest do
  use LearntlistWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "learntlist"
  end
end
