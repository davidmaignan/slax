defmodule Slax.Chat do
  alias Expo.Message
  alias Slax.Chat.{Message, Room}
  alias Slax.Repo

  import Ecto.Query

  def list_rooms() do
    Room
    |> order_by(asc: :name)
    |> Repo.all()
  end

  def get_room!(id) do
    Room |> Repo.get(id)
  end

  def change_room(room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end

  def create_room(attrs) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  def list_messages_in_room(%Room{id: room_id}) do
    Message
    |> where([m], m.room_id == ^room_id)
    |> order_by([m], asc: :inserted_at, asc: :id)
    |> Repo.all()
  end
end
