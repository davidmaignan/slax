defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  def list_rooms() do
    Room |> Repo.all()
  end

  def get_room(id) do
    Room |> Repo.get(id)
  end
end
