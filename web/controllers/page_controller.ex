defmodule Rundot.PageController do
  use Rundot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
