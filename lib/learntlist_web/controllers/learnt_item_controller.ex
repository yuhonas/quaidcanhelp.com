defmodule LearntlistWeb.LearntItemController do
  use LearntlistWeb, :controller

  alias Learntlist.LearntItems
  alias Learntlist.LearntItems.LearntItem

  def index(conn, _params) do
    learnt_items = LearntItems.list_learnt_items()
    render(conn, "index.html", learnt_items: learnt_items)
  end

  def new(conn, _params) do
    changeset = LearntItems.change_learnt_item(%LearntItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"learnt_item" => learnt_item_params}) do
    case LearntItems.create_learnt_item(learnt_item_params) do
      {:ok, learnt_item} ->
        conn
        |> put_flash(:info, "Learnt item created successfully.")
        |> redirect(to: Routes.learnt_item_path(conn, :show, learnt_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    learnt_item = LearntItems.get_learnt_item!(id)
    render(conn, "show.html", learnt_item: learnt_item)
  end

  def edit(conn, %{"id" => id}) do
    learnt_item = LearntItems.get_learnt_item!(id)
    changeset = LearntItems.change_learnt_item(learnt_item)
    render(conn, "edit.html", learnt_item: learnt_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "learnt_item" => learnt_item_params}) do
    learnt_item = LearntItems.get_learnt_item!(id)

    case LearntItems.update_learnt_item(learnt_item, learnt_item_params) do
      {:ok, learnt_item} ->
        conn
        |> put_flash(:info, "Learnt item updated successfully.")
        |> redirect(to: Routes.learnt_item_path(conn, :show, learnt_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", learnt_item: learnt_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    learnt_item = LearntItems.get_learnt_item!(id)
    {:ok, _learnt_item} = LearntItems.delete_learnt_item(learnt_item)

    conn
    |> put_flash(:info, "Learnt item deleted successfully.")
    |> redirect(to: Routes.learnt_item_path(conn, :index))
  end
end
