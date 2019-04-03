defmodule Events do
  @moduledoc false

  alias EmailEventSink.Repo

  def create(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  def get(), do: Event |> Repo.all
end
