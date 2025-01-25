defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div>Welcome to the chat!</div>
    """
  end
end
