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
    <form phx-change="transcribe">
      <input name="phrase" value="<%= assigns.phrase %>"
        class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal text-xl"
        placeholder="Type your phrase here..."
        autocomplete="off" />
    </form>

    <ol class="py-2 px-4">
      <%= for code_word <- assigns.code_words do %>
        <li class="code-word"><%= code_word %></li>
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

  @spec assign_phrase(Socket.t(), String.t()) :: Socket.t()
  defp assign_phrase(socket, phrase) do
    code_words = Nato.Transcriber.transcribe(phrase)
    assign(socket, phrase: phrase, code_words: code_words)
  end
end
