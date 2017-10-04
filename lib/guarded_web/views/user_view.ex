defmodule GuardedWeb.UserView do
  use GuardedWeb, :view
  alias GuardedWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user, jwt: jwt}) do
    %{
      data: render_one(user, UserView, "user.json")
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      is_admin: user.is_admin
    }
  end
end
