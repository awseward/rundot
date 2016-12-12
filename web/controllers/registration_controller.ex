defmodule Rundot.RegistrationController do
  use Rundot.Web, :controller
  alias Rundot.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Rundot.Registration.create(changeset, Rundot.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Welcome to rundot!")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Something didn't quite work there...")
        |> redirect(to: "new.html", changeset: changeset)
    end
  end
end
