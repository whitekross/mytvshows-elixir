defmodule Mytvshows.Repo.Migrations.CreateShow do
  use Ecto.Migration

  def change do
    create table(:tvshows) do
      add :title, :string, null: false
      add :network, :string
    end

    create unique_index(:tvshows, [:title])

    create table(:seasons) do
      add :tvshow_id, references(:tvshows), null: false
      add :index, :integer, null: false
    end

    create table(:episodes) do
      add :title, :string, null: false
      add :season_id, references(:seasons), null: false
      add :index, :integer, null: false
      add :aired_at, :date, null: false
      add :watched, :boolean, null: false, default: false
    end
  end
  
end
