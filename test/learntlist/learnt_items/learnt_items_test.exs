defmodule Learntlist.LearntItemsTest do
  use Learntlist.DataCase

  alias Learntlist.LearntItems

  describe "learnt_items" do
    alias Learntlist.LearntItems.LearntItem

    @valid_attrs %{abstract: "some abstract", title: "some title", url: "some url"}
    @update_attrs %{abstract: "some updated abstract", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{abstract: nil, title: nil, url: nil}

    def learnt_item_fixture(attrs \\ %{}) do
      {:ok, learnt_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> LearntItems.create_learnt_item()

      learnt_item
    end

    test "list_learnt_items/0 returns all learnt_items" do
      learnt_item = learnt_item_fixture()
      assert LearntItems.list_learnt_items() == [learnt_item]
    end

    test "get_learnt_item!/1 returns the learnt_item with given id" do
      learnt_item = learnt_item_fixture()
      assert LearntItems.get_learnt_item!(learnt_item.id) == learnt_item
    end

    test "create_learnt_item/1 with valid data creates a learnt_item" do
      assert {:ok, %LearntItem{} = learnt_item} = LearntItems.create_learnt_item(@valid_attrs)
      assert learnt_item.abstract == "some abstract"
      assert learnt_item.title == "some title"
      assert learnt_item.url == "some url"
    end

    test "create_learnt_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LearntItems.create_learnt_item(@invalid_attrs)
    end

    test "update_learnt_item/2 with valid data updates the learnt_item" do
      learnt_item = learnt_item_fixture()
      assert {:ok, %LearntItem{} = learnt_item} = LearntItems.update_learnt_item(learnt_item, @update_attrs)
      assert learnt_item.abstract == "some updated abstract"
      assert learnt_item.title == "some updated title"
      assert learnt_item.url == "some updated url"
    end

    test "update_learnt_item/2 with invalid data returns error changeset" do
      learnt_item = learnt_item_fixture()
      assert {:error, %Ecto.Changeset{}} = LearntItems.update_learnt_item(learnt_item, @invalid_attrs)
      assert learnt_item == LearntItems.get_learnt_item!(learnt_item.id)
    end

    test "delete_learnt_item/1 deletes the learnt_item" do
      learnt_item = learnt_item_fixture()
      assert {:ok, %LearntItem{}} = LearntItems.delete_learnt_item(learnt_item)
      assert_raise Ecto.NoResultsError, fn -> LearntItems.get_learnt_item!(learnt_item.id) end
    end

    test "change_learnt_item/1 returns a learnt_item changeset" do
      learnt_item = learnt_item_fixture()
      assert %Ecto.Changeset{} = LearntItems.change_learnt_item(learnt_item)
    end
  end
end
