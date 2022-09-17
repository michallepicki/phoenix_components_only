defmodule Hello.View.Home do
  use Phoenix.Component
  import Hello.Gettext

  use Phoenix.Component
  alias Hello.Layout

  def render(conn, app_name) do
    r(%{conn: conn, app_name: app_name})
  end

  attr :conn, Plug.Conn, required: true
  attr :app_name, :string, required: true

  defp r(assigns) do
    ~H"""
    <Layout.Root.r conn={@conn}>
      <Layout.App.r conn={@conn}>
        <.content app_name={@app_name} />
      </Layout.App.r>
    </Layout.Root.r>
    """
  end

  attr :app_name, :string, required: true

  defp content(assigns) do
    ~H"""
    <section class="phx-hero">
      <h1><%= gettext "Welcome to %{name}!", name: @app_name %></h1>
      <p>Peace of mind from prototype to production</p>
    </section>

    <section class="row">
      <article class="column">
        <h2>Resources</h2>
        <ul>
          <li>
            <a href="https://hexdocs.pm/phoenix/overview.html">Guides &amp; Docs</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix">Source</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix/blob/v1.7/CHANGELOG.md">v1.7 Changelog</a>
          </li>
        </ul>
      </article>
      <article class="column">
        <h2>Help</h2>
        <ul>
          <li>
            <a href="https://elixirforum.com/c/phoenix-forum">Forum</a>
          </li>
          <li>
            <a href="https://web.libera.chat/#elixir">#elixir on Libera Chat (IRC)</a>
          </li>
          <li>
            <a href="https://twitter.com/elixirphoenix">Twitter @elixirphoenix</a>
          </li>
          <li>
            <a href="https://elixir-slackin.herokuapp.com/">Elixir on Slack</a>
          </li>
          <li>
            <a href="https://discord.gg/elixir">Elixir on Discord</a>
          </li>
        </ul>
      </article>
    </section>
    """
  end
end
