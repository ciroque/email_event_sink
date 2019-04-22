defmodule EmailEventSinkWeb.Router do
  use EmailEventSinkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EmailEventSinkWeb do
    pipe_through :api

    scope "/email" do
      resources, "/events", EventSinkController, only: [:create, :index]
    end
  end
end

