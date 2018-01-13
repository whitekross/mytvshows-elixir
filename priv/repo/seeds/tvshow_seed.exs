import Seedex
import Ecto.Query

alias Mytvshows.Repo
alias Mytvshows.Tvshow
alias Mytvshows.Season
alias Mytvshows.Episode

reset = "TRUNCATE episodes, seasons, tvshows;"
Ecto.Adapters.SQL.query!(Repo, reset, [])

seed Tvshow, [
    %{title: "Stranger Things", network: "Netflix"},
    %{title: "Game of Thrones", network: "HBO"},
    %{title: "Black Mirror", network: "Netflix"}
]

tvshow = Repo.one(from s in Tvshow, where: s.title == "Stranger Things")
seed Season, [
    %{tvshow: tvshow, index: 1},
    %{tvshow: tvshow, index: 2}
]

season = Repo.one(from s in Season, where: s.index == 1)
seed Episode, [
    %{title: "Chapter One: The Vanishing of Will Byers", index: 1, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Two: The Weirdo on Maple Street", index: 2, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Three: Holly, Jolly", index: 3, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Four: The Body", index: 4, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Five: The Flea and the Acrobat", index: 5, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Six: The Monster", index: 6, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Seven: The Bathtub", index: 7, season: season, aired_at: Date.from_iso8601!("2016-07-15")},
    %{title: "Chapter Eight: The Upside Down", index: 8, season: season, aired_at: Date.from_iso8601!("2016-07-15")}
]

tvshow2 = Repo.one(from s in Tvshow, where: s.title == "Game of Thrones")
seed Season, [
    %{tvshow: tvshow2, index: 1},
    %{tvshow: tvshow2, index: 2},
    %{tvshow: tvshow2, index: 3},
    %{tvshow: tvshow2, index: 4},
    %{tvshow: tvshow2, index: 5},
    %{tvshow: tvshow2, index: 6}
]

tvshow3 = Repo.one(from s in Tvshow, where: s.title == "Black Mirror")
seed Season, [
    %{tvshow: tvshow3, index: 1},
    %{tvshow: tvshow3, index: 2},
    %{tvshow: tvshow3, index: 3},
    %{tvshow: tvshow3, index: 4},
]