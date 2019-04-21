defmodule EmailEventSink.Repo.Migrations.AddFields do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add(:smtp_id, :string)
      add(:useragent, :string)
      add(:ip, :string)
      add(:sg_event_id, :string)
      add(:sg_message_id, :string)
      add(:reason, :string)
      add(:status, :string)
      add(:response, :string)
      add(:tls, :boolean)
      add(:url, :string)
      add(:urloffset, :string)
      add(:attempt, :integer)
      add(:category, :string)
      add(:type, :string)
    end
  end
end
