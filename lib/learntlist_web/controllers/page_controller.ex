defmodule LearntlistWeb.PageController do
  use LearntlistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
