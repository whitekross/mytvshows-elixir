defmodule Mytvshows.Season do
  use Mytvshows.Schema
  import Ecto.Changeset


  schema "seasons" do
    field :index, :integer

    belongs_to :tvshow, Mytvshows.Tvshow
    has_many :episodes, Mytvshows.Episode

    # field :first_aired_at, :date, virtual: true
    # field :last_aired_at, :date, virtual: true
  end

  def changeset(season, params \\ %{}) do
    season
    |> cast(params, [:index, :tvshow_id])
    |> validate_required([:index, :tvshow_id])
    |> foreign_key_constraint(:tvshow_id)
  end

end