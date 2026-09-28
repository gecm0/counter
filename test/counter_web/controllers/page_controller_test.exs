defmodule CounterWeb.PageControllerTest do
  use CounterWeb.ConnCase

  test "GET /up", %{conn: conn} do
    assert conn |> get(~p"/up") |> text_response(200) == "ok"
  end
end
