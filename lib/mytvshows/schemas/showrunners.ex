defmodule Tvshows.ShowRunner do
    use Ecto.Schema
  
    schema "showrunners" do
      field :name, :string
    end
  end