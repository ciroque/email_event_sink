defmodule EmailEventSinkWeb.EventSinkController do
  use EmailEventSinkWeb, :controller

  require Logger

  def create(conn, %{"_json" => events}) do
    Logger.info("#{__MODULE__}::create #{inspect(events)}")
    events |>
      Enum.map(
        fn %{"timestamp" => event_timestamp, "smtp-id" => smtp_id} = event ->
          attrs = event
            |> Map.put_new("event_timestamp", event_timestamp)
            |> Map.put_new("smtp_id", smtp_id)
          Events.create(attrs)
        end)
    conn |> render("create.json", %{event: %{}})
  end

  def index(conn, params) do
    Logger.info("#{__MODULE__}::get #{inspect(params)}")

    events = Events.get()

    Logger.debug("#{__MODULE__}::get events => #{inspect(events)}")

    conn |> render("index.json", %{events: events})
  end
end

