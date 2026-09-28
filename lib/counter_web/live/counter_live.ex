defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: Counter.subscribe()
    {:ok, assign(socket, count: Counter.get())}
  end

  def handle_event("inc", _params, socket) do
    {:noreply, assign(socket, count: Counter.increment())}
  end

  def handle_info({:count, count}, socket), do: {:noreply, assign(socket, count: count)}

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="flex flex-col items-center gap-8 py-24">
        <p id="count" class="text-8xl font-bold tabular-nums">{@count}</p>
        <button id="inc" phx-click="inc" class="btn btn-primary btn-lg">+1</button>
        <p class="text-sm opacity-60">Shared by everyone, live. Open it in two tabs.</p>
      </div>
    </Layouts.app>
    """
  end
end
