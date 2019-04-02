defmodule EmailEventSink.Repo do
  use Ecto.Repo,
    otp_app: :email_event_sink,
    adapter: Ecto.Adapters.Postgres
end
