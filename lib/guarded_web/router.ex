defmodule GuardedWeb.Router do
  use GuardedWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guarded.Guardian.AuthPipeline
  end

  scope "/api", GuardedWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end