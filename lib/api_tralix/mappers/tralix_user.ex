defmodule Tralix.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :name, :string 
    field :age, :integer
    field :company
    field :city
    timestamps()
  end

  def signup_changeset(user = %Tralix.User{}, params) do
    user
      |> cast(params, [:name, :age, :company])
      |> validate_required([:name, :age])
  end

  def search(user_id) do
    query =  from u in Tralix.User,
             where: u.id == ^user_id,
             select: u
    ApiTralix.Repo.one(query)
  end

  def search_all do
    query =  from u in Tralix.User,
             select: [u.name, u.age]
    ApiTralix.Repo.all(query)
  end
end