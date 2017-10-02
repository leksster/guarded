defmodule GuardedWeb.UserController do
  require IEx

  use GuardedWeb, :controller

  alias Guarded.Repo
  alias Guarded.Accounts
  alias Guarded.Accounts.User
  alias Guarded.Guardian

  action_fallback GuardedWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        # IEx.pry
        new_conn = Guardian.Plug.sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> send_resp(201, "alalal #{jwt}")
        # |> put_status(:created)
        # |> render(Guarded.SessionView, "show.json", user: user, jwt: jwt)
      {:error, changeset} ->
        conn
        |> send_resp(404, "alalal")
        # |> render(Guarded.ChangesetView, "error.json", changeset: changeset)
    end

    # with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", user_path(conn, :show, user))
    #   |> render("show.json", user: user)
    # end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
