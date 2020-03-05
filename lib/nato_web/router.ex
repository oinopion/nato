defmodule NatoWeb.Router do
  use NatoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NatoWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/transcribe", TranscriberLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", NatoWeb do
  #   pipe_through :api
  # end
end
