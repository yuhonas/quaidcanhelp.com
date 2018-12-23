defmodule Learntlist.LearntItems do
  @moduledoc """
  The LearntItems context.
  """

  import Ecto.Query, warn: false
  alias Learntlist.Repo

  alias Learntlist.LearntItems.LearntItem

  @doc """
  Returns the list of learnt_items.

  ## Examples

      iex> list_learnt_items()
      [%LearntItem{}, ...]

  """
  def list_learnt_items do
    Repo.all(LearntItem)
  end

  @doc """
  Gets a single learnt_item.

  Raises `Ecto.NoResultsError` if the Learnt item does not exist.

  ## Examples

      iex> get_learnt_item!(123)
      %LearntItem{}

      iex> get_learnt_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_learnt_item!(id), do: Repo.get!(LearntItem, id)

  @doc """
  Creates a learnt_item.

  ## Examples

      iex> create_learnt_item(%{field: value})
      {:ok, %LearntItem{}}

      iex> create_learnt_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_learnt_item(attrs \\ %{}) do
    %LearntItem{}
    |> LearntItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a learnt_item.

  ## Examples

      iex> update_learnt_item(learnt_item, %{field: new_value})
      {:ok, %LearntItem{}}

      iex> update_learnt_item(learnt_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_learnt_item(%LearntItem{} = learnt_item, attrs) do
    learnt_item
    |> LearntItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LearntItem.

  ## Examples

      iex> delete_learnt_item(learnt_item)
      {:ok, %LearntItem{}}

      iex> delete_learnt_item(learnt_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_learnt_item(%LearntItem{} = learnt_item) do
    Repo.delete(learnt_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking learnt_item changes.

  ## Examples

      iex> change_learnt_item(learnt_item)
      %Ecto.Changeset{source: %LearntItem{}}

  """
  def change_learnt_item(%LearntItem{} = learnt_item) do
    LearntItem.changeset(learnt_item, %{})
  end
end
