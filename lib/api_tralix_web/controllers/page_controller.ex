defmodule ApiTralixWeb.PageController do
  use ApiTralixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
