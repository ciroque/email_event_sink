defmodule EmailEventSinkWeb.EventSinkView do
  use EmailEventSinkWeb, :view

  def render("create.json", %{event: event}) do
    event |> Map.drop([:__meta__, :__struct__])
  end

  def render("index.json", %{events: events}) do
    %{data: render_many(events, __MODULE__, "events.json")}
  end

  def render("events.json", %{events: %Event{} = event}) do
    event |> Map.drop([:__struct__, :__meta__, :updated_at, :inserted_at])
  end
end

