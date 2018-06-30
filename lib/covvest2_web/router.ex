defmodule Covvest2Web.Router do
  use Covvest2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Covvest2Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/projectdetail", PageController, :projectdetail
    get "/userprofile", PageController, :usershow
    get "/operatorprofile", PageController, :operatorshow
    get "/projectlist", PageController, :projectlist
  end

  # Other scopes may use custom stacks.
  # scope "/api", Covvest2Web do
  #   pipe_through :api
  # end
end
