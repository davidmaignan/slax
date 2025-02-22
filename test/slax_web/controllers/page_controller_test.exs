defmodule SlaxWeb.PageControllerTest do
  use SlaxWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Slax.Chat.Room
  alias Slax.Repo

  @room1 %{name: "the-shire", topic: "Bilbo's birthday party"}
  @room2 %{name: "rivendale", topic: "Where the elves live"}

  setup do
    room1 =
      %Room{}
      |> Room.changeset(@room1)
      |> Repo.insert!()

    room2 =
      %Room{}
      |> Room.changeset(@room2)
      |> Repo.insert!()

    {:ok, rooms: [room1, room2]}
  end

  test "GET /", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")
    html = render(view)

    h1 = Floki.find(html, "h1") |> Floki.text()
    assert String.contains?(h1, "Slax")
    assert String.contains?(h1, "rivendale")
  end
end
