defmodule Event do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field(:email, :string)
    field(:event, :string)
    field(:event_timestamp, :integer)

    timestamps()
  end

  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:email, :event, :event_timestamp])
    |> validate_required([:email, :event])
  end
end
