defmodule FinaGranaWeb.PageController do
  use FinaGranaWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
