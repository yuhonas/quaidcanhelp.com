defmodule LearntlistWeb.PageController do
  use LearntlistWeb, :controller
  alias Learntlist.LearntItems

  def index(conn, params) do
    page = Learntlist.Repo.paginate(LearntItems.LearntItem, params)

    render(conn, "index.html", learnt_items: page.entries, page: page)
  end
end
