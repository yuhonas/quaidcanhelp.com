defmodule QuaidcanhelpWeb.PageControllerTest do
  use QuaidcanhelpWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Quaid Can Help"
  end
end
