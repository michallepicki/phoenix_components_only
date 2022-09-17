defmodule Hello.Controller.Home do
  use Phoenix.Controller, namespace: Hello, put_default_views: false
  import Plug.Conn

  def index(conn, _params) do
    rendered =
      Hello.View.Home.render(conn, "Hello")
      |> Phoenix.HTML.Engine.encode_to_iodata!()

    conn
    |> put_resp_header("content-type", MIME.type("html") <> "; charset=utf-8")
    |> send_resp(200, rendered)
  end
end
