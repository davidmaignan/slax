defmodule SlaxWeb.PageControllerTest do
  use SlaxWeb.ConnCase

  alias Slax.Chat.Room
  alias Slax.Repo

  @attr %{name: "the-shire", topic: "Bilbo's birthday party"}

  setup do
    user =
      %Room{}
      |> Room.changeset(@attr)
      |> Repo.insert!()

    {:ok, user: user}
  end

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end
end
