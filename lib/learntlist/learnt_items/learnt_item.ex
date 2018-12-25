defmodule Learntlist.LearntItems.LearntItem do
  @moduledoc """
  The LearntItem model.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "learnt_items" do
    field :title, :string # http://xmlns.com/foaf/0.1/name
    field :abstract, :string # http://dbpedia.org/ontology/abstract
    field :url, :string # http://xmlns.com/foaf/0.1/isPrimaryTopicOf

    timestamps()
  end

  @doc false
  def changeset(learnt_item, attrs) do
    learnt_item
    |> cast(attrs, [:title, :abstract, :url])
    |> validate_required([:url])
  end
end
