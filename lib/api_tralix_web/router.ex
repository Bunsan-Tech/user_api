defmodule ApiTralixWeb.Router do
  use ApiTralixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug ApiTralixWeb.HeaderValidation
  end

  scope "/", ApiTralixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", ApiTralixWeb do
    pipe_through :api
    resources "/users", UserController, only: [:index, :show, :create]
  end
end
