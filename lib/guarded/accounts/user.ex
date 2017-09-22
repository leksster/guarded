defmodule Guarded.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guarded.Accounts.User


  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password, :is_admin])
    |> validate_required([:email, :password, :is_admin])
  end
end
