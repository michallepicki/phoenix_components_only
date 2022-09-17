defmodule Hello.Layout.Root do
  use Phoenix.Component
  use Phoenix.VerifiedRoutes,
    endpoint: Hello.Endpoint,
    router: Hello.Router,
    statics: Hello.static_paths()

  import Phoenix.Controller, only: [get_csrf_token: 0]

  slot :inner_block, required: true
  attr :conn, Plug.Conn, required: true

  def r(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="csrf-token" content={get_csrf_token()} />
        <%= live_title_tag(assigns[:page_title] || "Hello", suffix: " · Phoenix Framework") %>
        <link phx-track-static rel="stylesheet" href={~p"/assets/app.css"} />
        <script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}>
        </script>
      </head>
      <body>
        <header>
          <section class="container">
            <nav>
              <ul>
                <li><a href="https://hexdocs.pm/phoenix/overview.html">Get Started</a></li>
              </ul>
            </nav>
            <a href="https://phoenixframework.org/" class="phx-logo">
              <img src={~p"/images/phoenix.png"} alt="Phoenix Framework Logo" />
            </a>
          </section>
        </header>
        <%= render_slot(@inner_block) %>
      </body>
    </html>
    """
  end
end
