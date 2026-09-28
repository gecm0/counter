defmodule CounterWeb.PageController do
  use CounterWeb, :controller

  # Health check for kamal-proxy; excluded from force_ssl in config/prod.exs.
  def up(conn, _params), do: text(conn, "ok")
end
