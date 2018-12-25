defmodule Learntlist.Repo.Migrations.CreateLearntItems do
  use Ecto.Migration

  def change do
    create table(:learnt_items) do
      add :title, :string
      add :abstract, :text
      add :url, :string

      timestamps()
    end

  end
end
