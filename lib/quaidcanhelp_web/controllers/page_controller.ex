defmodule QuaidcanhelpWeb.PageController do
  use QuaidcanhelpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
