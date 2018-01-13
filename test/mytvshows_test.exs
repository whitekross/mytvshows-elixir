defmodule MytvshowsTest do
  use ExUnit.Case
  doctest Mytvshows

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Mytvshows.Repo)
  end

  test "it should get_tvshow_by_name" do
    tvshow = Mytvshows.get_tvshow_by_name("Stranger Things")
    assert tvshow.title == "Stranger Things"
  end

  test "it should get_tvshows_by_network" do
    tvshows = Mytvshows.get_tvshows_by_network("Netflix")
    tvshow = tvshows |> List.first
    assert length(tvshows) == 2
    assert tvshow.title == "Stranger Things"
  end

end
