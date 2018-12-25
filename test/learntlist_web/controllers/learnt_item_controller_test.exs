defmodule LearntlistWeb.LearntItemControllerTest do
  use LearntlistWeb.ConnCase

  alias Learntlist.LearntItems

  @create_attrs %{abstract: "some abstract", title: "some title", url: "some url"}
  @update_attrs %{abstract: "some updated abstract", title: "some updated title", url: "some updated url"}
  @invalid_attrs %{abstract: nil, title: nil, url: nil}

  def fixture(:learnt_item) do
    {:ok, learnt_item} = LearntItems.create_learnt_item(@create_attrs)
    learnt_item
  end

  describe "new learnt_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.learnt_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Learnt item"
    end
  end

  describe "create learnt_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.learnt_item_path(conn, :create), learnt_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.learnt_item_path(conn, :show, id)

      conn = get(conn, Routes.learnt_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Learnt item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.learnt_item_path(conn, :create), learnt_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Learnt item"
    end
  end

  describe "edit learnt_item" do
    setup [:create_learnt_item]

    test "renders form for editing chosen learnt_item", %{conn: conn, learnt_item: learnt_item} do
      conn = get(conn, Routes.learnt_item_path(conn, :edit, learnt_item))
      assert html_response(conn, 200) =~ "Edit Learnt item"
    end
  end

  describe "update learnt_item" do
    setup [:create_learnt_item]

    test "redirects when data is valid", %{conn: conn, learnt_item: learnt_item} do
      conn = put(conn, Routes.learnt_item_path(conn, :update, learnt_item), learnt_item: @update_attrs)
      assert redirected_to(conn) == Routes.learnt_item_path(conn, :show, learnt_item)

      conn = get(conn, Routes.learnt_item_path(conn, :show, learnt_item))
      assert html_response(conn, 200) =~ "some updated abstract"
    end

    test "renders errors when data is invalid", %{conn: conn, learnt_item: learnt_item} do
      conn = put(conn, Routes.learnt_item_path(conn, :update, learnt_item), learnt_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Learnt item"
    end
  end

  describe "delete learnt_item" do
    setup [:create_learnt_item]

    test "deletes chosen learnt_item", %{conn: conn, learnt_item: learnt_item} do
      conn = delete(conn, Routes.learnt_item_path(conn, :delete, learnt_item))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.learnt_item_path(conn, :show, learnt_item))
      end
    end
  end

  defp create_learnt_item(_) do
    learnt_item = fixture(:learnt_item)
    {:ok, learnt_item: learnt_item}
  end
end
