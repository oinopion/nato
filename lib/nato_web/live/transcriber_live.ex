defmodule NatoWeb.TranscriberLive do
  use Phoenix.LiveView

  require Logger

  def mount(%{"phrase" => phrase}, _session, socket) do
    {:ok, assign_phrase(socket, phrase)}
  end

  def mount(_params, _session, socket) do
    {:ok, assign_phrase(socket, "")}
  end

  def render(assigns) do
    ~L"""
    <h1>Transcribing...</h1>

    <form phx-change="transcribe">
      <input name="phrase" value="<%= assigns.phrase %>" autocomplete="off" />
    </form>

    <ol>
      <%= for code_word <- assigns.code_words do %>
        <li><%= code_word %></li>
      <% end %>
    </ol>
    """
  end

  def handle_event("transcribe", %{"phrase" => phrase}, socket) do
    {:noreply, assign_phrase(socket, phrase)}
  end

  def handle_event(event, params, socket) do
    Logger.warn("Unhandled event \"#{event}\" with params #{inspect(params)}")
    {:noreply, socket}
  end

  defp assign_phrase(socket, phrase) do
    code_words = Nato.Transcriber.transcribe(phrase)
    assign(socket, phrase: phrase, code_words: code_words)
  end
end
