defmodule Mytvshows.Tvshow do
  use Mytvshows.Schema
  import Ecto.Changeset

  schema "tvshows" do
    field :title, :string
    field :network, :string

    has_many :seasons, Mytvshows.Season

    field :first_aired_at, :date, virtual: true
    field :last_aired_at, :date, virtual: true
  end

  def changeset(tvshow, params \\ %{}) do
    tvshow
    |> cast(params, [:title, :network])
    |> validate_required([:title, :network])
    |> unique_constraint(:title)
  end
end