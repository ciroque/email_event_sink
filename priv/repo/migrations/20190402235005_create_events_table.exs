defmodule EmailEventSink.Repo.Migrations.CreateEventsTable do
  use Ecto.Migration

  def change do
    create table(:events) do
      add(:email, :string)
      add(:event, :string)
      add(:event_timestamp, :timestamp)

      timestamps()
    end
  end
end
