defmodule Mytvshows.Episode do
    use Mytvshows.Schema
    import Ecto.Changeset

  schema "episodes" do
    field :title, :string
    field :index, :integer
    field :watched, :boolean
    field :aired_at, :date

    belongs_to :season, Mytvshows.Season
  end


  def changeset(episode, params \\ %{}) do
    episode
    |> cast(params, [:title, :index, :watched, :aired_at])
    |> validate_required([:title, :index, :aired_at])
    |> put_assoc(:season, required: true)
  end
end