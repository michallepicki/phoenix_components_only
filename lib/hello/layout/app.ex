defmodule Hello.Layout.App do
  use Phoenix.Component
  import Phoenix.Controller, only: [get_flash: 2]

  slot :inner_block, required: true
  attr :conn, Plug.Conn, required: true

  def r(assigns) do
    ~H"""
    <main class="container">
      <p class="alert alert-info" role="alert"><%= get_flash(@conn, :info) %></p>
      <p class="alert alert-danger" role="alert"><%= get_flash(@conn, :error) %></p>
      <%= render_slot(@inner_block) %>
    </main>
    """
  end
end
