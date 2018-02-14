defmodule ApiTralixWeb.UserController do
  use ApiTralixWeb, :controller

  def index(conn, _params) do
    conn
      |> put_status(401)
      |> text("Unauth")
  end

  def show(conn, %{"id" => user_id}) do
    case Tralix.User.search(user_id) do
      nil ->
        conn
          |> put_status(404)
          |> json(%{error: "User with id #{user_id} not found"})
      user ->
        conn
          |> put_status(200)
          |> json(%{user: %{name: user.name, user_id: user.id}})
    end
  end
  
  def create(conn, params) do
    %{"user" => user_params} = params
    changeset = Tralix.User.signup_changeset(%Tralix.User{}, user_params)
    case changeset.valid? do
      true ->
        user = ApiTralix.Repo.insert!(changeset)
        conn
          |> put_status(200)
          |> json(%{user: %{name: user.name, user_id: user.id}})
      false ->
        conn
          |> put_status(400)
          |> json(parse_errors(changeset.errors))
    end
  end

  def parse_errors(errors) do
    errors
      |> Enum.map(fn {k, v} -> "#{k}: #{inspect v}" end)
  end
end