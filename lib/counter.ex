defmodule Counter do
  @moduledoc """
  A single counter shared by every visitor.
  """
  # ponytail: in-memory state, resets on every deploy; move to a DB if it must persist.
  use Agent

  @topic "counter"

  def start_link(_opts), do: Agent.start_link(fn -> 0 end, name: __MODULE__)

  def subscribe, do: Phoenix.PubSub.subscribe(Counter.PubSub, @topic)

  def get, do: Agent.get(__MODULE__, & &1)

  def increment do
    count = Agent.get_and_update(__MODULE__, &{&1 + 1, &1 + 1})
    Phoenix.PubSub.broadcast(Counter.PubSub, @topic, {:count, count})
    count
  end
end
