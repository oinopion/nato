defmodule NatoWeb.PageController do
  use NatoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
