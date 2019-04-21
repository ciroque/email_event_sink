defmodule Event do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field(:email, :string)
    field(:event, :string)
    field(:event_timestamp, :integer)

    field(:smtp_id, :string)
    field(:useragent, :string)
    field(:ip, :string)
    field(:sg_event_id, :string)
    field(:sg_message_id, :string)
    field(:reason, :string)
    field(:status, :string)
    field(:response, :string)
    field(:tls, :boolean)
    field(:url, :string)
    field(:urloffset, :string)
    field(:attempt, :integer)
    field(:category, :string)
    field(:type, :string)

    timestamps()
  end

  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [
      :email,
      :event,
      :event_timestamp,
      :smtp_id,
      :useragent,
      :ip,
      :sg_event_id,
      :sg_message_id,
      :reason,
      :status,
      :response,
      :tls,
      :url,
      :urloffset,
      :attempt,
      :category,
      :type
    ])
    |> validate_required([:email, :event])
  end
end
