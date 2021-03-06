# An example that shows the basics of event handling and rendering.
#
# Run this example with:
#
#   mix run examples/counter.exs

defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  def init(_context), do: 0

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?+}} -> model + 1
      {:event, %{ch: ?-}} -> model - 1
      _ -> model
    end
  end

  def render(model) do
    view do
      label(
        content: "Counter is #{model} (+/- to increment/decrement, q to quit)"
      )
    end
  end
end

Ratatouille.run(Counter)
