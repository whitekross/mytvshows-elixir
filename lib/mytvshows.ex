defmodule Mytvshows do
  @moduledoc """
  Documentation for Mytvshows.
  """

  import Ecto.Query
  alias Mytvshows.Tvshow
  alias Mytvshows.Season
  alias Mytvshows.Episode
  alias Mytvshows.Repo

  def get_tvshow_by_name(title) do
    q = from(
      t in Tvshow,
      where: t.title == ^title
    ) |> Repo.one
  end

  def get_tvshows_by_network(network) do
    (from Tvshow,
      where: [network: ^network],
      select: [:id, :title])
    |> Repo.all
  end

  def insert_new_season(tvshow_id, index) do
    season_info = %{index: index, tvshow_id: tvshow_id}
    Season.changeset(%Season{}, season_info) |> Repo.insert
  end

  def get_tvshow_and_season(tvshow_id, index) do
    q = from(
      t in Tvshow,
      left_join: s in Season, on: t.id == s.tvshow_id,
      left_join: e in Episode, on: s.id == e.season_id,
      where: t.id == ^tvshow_id,
      where: s.index == ^index,
      group_by: t.id,
      select: %{t | first_aired_at: min(e.aired_at), last_aired_at: max(e.aired_at)}
    ) |> Repo.one
  end
end
