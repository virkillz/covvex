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

  pipeline :admin_layout do
    plug :put_layout, {Covvest2Web, :cust}
  end

  scope "/", Covvest2Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/projectdetail", PageController, :projectdetail
    get "/userprofile", PageController, :usershow
    get "/operatorprofile", PageController, :operatorshow
    get "/projects", PageController, :projectindex
    get "/operators", PageController, :operatorlist
    get "/operators/:id", PageController, :operatorshow 
    get "/projects/:id", PageController, :projectshow   
    get "/purchase", PageController, :purchase
    get "/purchasereport", PageController, :purchasereport

  end

  scope "/admin", Covvest2Web do
    pipe_through :browser

    resources "/operators", OperatorController
    resources "/assets", AssetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Covvest2Web do
  #   pipe_through :api
  # end
end
