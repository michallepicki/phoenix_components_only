defmodule Hello.Router do
  use Phoenix.Router, helpers: false

  import Plug.Conn
  import Phoenix.Controller
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hello.Controller do
    pipe_through :browser

    get "/", Home, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hello do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:hello, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
