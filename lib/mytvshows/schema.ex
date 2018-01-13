# Define a module to be used as base
defmodule Mytvshows.Schema do
    defmacro __using__(_) do
      quote do
        use Ecto.Schema
        #@primary_key {:id, :binary_id, autogenerate: true}
        #@foreign_key_type :binary_id
        @primary_key {:id, :id, autogenerate: true}
        @foreign_key_type :id
      end
    end
  end