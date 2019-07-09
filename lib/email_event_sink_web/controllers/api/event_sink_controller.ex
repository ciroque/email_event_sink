defmodule EmailEventSinkWeb.EventSinkController do
  use EmailEventSinkWeb, :controller

  require Logger

  def create(conn, %{"_json" => events}) do
    Logger.info("#{__MODULE__}::create #{inspect(events)}")
    events |>
      Enum.map(
        fn %{"timestamp" => event_timestamp} = event ->
          attrs = event
            |> Map.put_new("event_timestamp", event_timestamp)
            |> Map.put("category", fix_categories(Map.get(event, "category")))
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

  defp fix_categories(nil), do: ""
  defp fix_categories(categories) when is_list(categories) do
    categories |> List.foldl([], fn x, acc -> ["\"#{x}\"" | acc]  end) |> Enum.join(",")
  end
  defp fix_categories(categories) do
    categories
  end
end
