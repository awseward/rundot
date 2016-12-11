defmodule Rundot.RunView do
  use Rundot.Web, :view
  use Timex

  def get_today_as_date do
    t = Timex.local |> Timex.to_date |> Timex.to_datetime(:local)
    %Ecto.DateTime{year: t.year, month: t.month, day: t.day}
  end

end
