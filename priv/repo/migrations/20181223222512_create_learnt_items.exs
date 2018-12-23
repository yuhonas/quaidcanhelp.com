defmodule Learntlist.Repo.Migrations.CreateLearntItems do
  use Ecto.Migration

  def change do
    create table(:learnt_items) do
      add :title, :string
      add :body, :text
      add :url, :string

      timestamps()
    end

  end
end
