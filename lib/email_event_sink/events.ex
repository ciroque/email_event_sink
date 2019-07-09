defmodule Events do
  @moduledoc false

  alias EmailEventSink.Repo

  require Logger

  def create(attrs \\ %{}) do
    result = %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
    
    Logger.info("Created new event: #{inspect(result)}")
    
    result
  end

  def get(), do: Event |> Repo.all
end
