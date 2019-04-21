defmodule EmailEventSinkWeb.EventSinkController do
  use EmailEventSinkWeb, :controller

  require Logger

  def create(conn, %{"_json" => events}) do
    Logger.info("#{__MODULE__}::create #{inspect(events)}")
    events |> Enum.map(fn %{"timestamp" => event_timestamp} = event -> Events.create(event |> Map.put_new("event_timestamp", event_timestamp)) end)
    conn |> render("create.json", %{event: %{}})
  end
end
