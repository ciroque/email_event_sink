defmodule EmailEventSinkWeb.EventSinkView do
  use EmailEventSinkWeb, :view

  def render("create.json", %{event: event}) do
    event |> Map.drop([:__meta__, :__struct__])
  end
end
