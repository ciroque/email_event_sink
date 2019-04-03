defmodule EmailEventSinkWeb.EventSinkController do
  use EmailEventSinkWeb, :controller

  def create(conn, %{"email" => _email, "event" => _event, "timestamp" => event_timestamp} = event) do
    {:ok, created} = Events.create(event |> Map.put_new("event_timestamp", event_timestamp))
    conn |> render("create.json", %{event: created})
  end
end
