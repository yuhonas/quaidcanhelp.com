defmodule Learntlist.LearntItems.LearntItem do
  @moduledoc """
  The LearntItem model.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "learnt_items" do
    field :body, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(learnt_item, attrs) do
    learnt_item
    |> cast(attrs, [:title, :body, :url])
    |> validate_required([:title, :body, :url])
  end
end
