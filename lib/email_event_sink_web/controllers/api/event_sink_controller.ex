defmodule EmailEventSinkWeb.EventSinkController do
  use EmailEventSinkWeb, :controller

  def create(conn, %{"email" => _email, "event" => _event, "timestamp" => _event_timestamp} = event) do
    {:ok, created} = Events.create(event)
    conn |> render("create.json", %{event: created})
  end
end
