require IEx
defmodule Rundot.RunController do
  use Rundot.Web, :controller
  use Timex

  alias Rundot.Run

  def index(conn, _params) do
    runs = Repo.all(Run)
    render(conn, "index.html", runs: runs)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Run.changeset(%Run{}))
  end

  def create(conn, %{"run" => run_params}) do
    case Repo.insert(Run.changeset(%Run{}, run_params)) do
      {:ok, _run} ->
        conn
        |> put_flash(:info, "Run created successfully.")
        |> redirect(to: run_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", run: Repo.get!(Run, id))
  end

  def edit(conn, %{"id" => id}) do
    run = Repo.get!(Run, id)
    render(conn, "edit.html", run: run, changeset: Run.changeset(run))
  end

  def update(conn, %{"id" => id, "run" => run_params}) do
    run = Repo.get!(Run, id)

    case Repo.update(Run.changeset(run, run_params)) do
      {:ok, run} ->
        conn
        |> put_flash(:info, "Run updated successfully.")
        |> redirect(to: run_path(conn, :show, run))
      {:error, changeset} ->
        render(conn, "edit.html", run: run, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    run = Repo.get!(Run, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(run)

    conn
    |> put_flash(:info, "Run deleted successfully.")
    |> redirect(to: run_path(conn, :index))
  end
end
