defmodule Guarded.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def up do
    rename table("users"), :password, to: :password_hash

    alter table(:users) do
      modify :password_hash, :string, null: false
      modify :email, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
    end

    create unique_index(:users, [:email])
  end

  def down do
    rename table("users"), :password_hash, to: :password

    alter table(:users) do
      modify :password, :string
      modify :email, :string
      remove :first_name
      remove :last_name
    end

    drop index(:users, [:email])
  end
end
