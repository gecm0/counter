defmodule CounterWeb.CounterLiveTest do
  use CounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "clicking +1 updates every connected viewer", %{conn: conn} do
    {:ok, a, _} = live(conn, ~p"/")
    {:ok, b, _} = live(conn, ~p"/")
    before = Counter.get()

    a |> element("#inc") |> render_click()

    assert render(b) =~ ~r/id="count"[^>]*>\s*#{before + 1}\s*</
  end
end
