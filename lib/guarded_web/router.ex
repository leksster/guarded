defmodule GuardedWeb.Router do
  use GuardedWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenicate do
    plug Guarded.Guardian.AuthPipeline
  end

  scope "/api", GuardedWeb do
    pipe_through [:api, :authenicate]

    resources "/session", SessionController, only: [:delete, :update], singleton: true
  end

  scope "/api", GuardedWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/session", SessionController, only: [:create], singleton: true
  end
end
