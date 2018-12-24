defmodule LearntlistWeb.PageController do
  use LearntlistWeb, :controller
  alias Learntlist.LearntItems

  def index(conn, _params) do
    learnt_items = LearntItems.list_learnt_items()
    render(conn, "index.html", learnt_items: learnt_items)
  end
end
