defmodule NatoWeb.TranscriberLive do
  use Phoenix.LiveView

  require Logger

  def mount(_session, socket) do
    {:ok, assign(socket, %{phrase: ""})}
  end

  def render(assigns) do
    ~L"""
    <h1>Transcribing...</h1>

    <form phx-change="transcribe">
      <input name="phrases" />
    </form>

    <ol>
      <%= for char <- String.codepoints(assigns.phrase) do %>
        <li><%= char %></li>
      <% end %>
    </ol>
    """
  end

  def handle_event("transcribe", %{"phrase" => phrase}, socket) do
    {:noreply, assign(socket, phrase: phrase)}
  end

  def handle_event(event, params, socket) do
    Logger.warn("Unhandled event \"#{event}\" with params #{inspect(params)}")
    {:noreply, socket}
  end
end
