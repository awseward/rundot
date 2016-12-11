defmodule Rundot.RunView do
  use Rundot.Web, :view
  use Timex

  def new_run_link(conn, label \\ "New run") do
    link(label, to: run_path(conn, :new))
  end

  def get_today_as_date do
    t = Timex.local |> Timex.to_date |> Timex.to_datetime(:local)
    %Ecto.DateTime{year: t.year, month: t.month, day: t.day}
  end

end
