defmodule Room do
  require NITRO;
  require N2O;

  def event(:init) do
    case :n2o.session(:room) do
       [] -> :nitro.redirect("/app/index.htm");
       room ->
        :n2o.reg({:room, room})
        :nitro.update(:send, NITRO.button(
          id: :send,
          body: "Send Message",
          postback: :send_message,
          source: [:message]
        ))
    end
  end
  def event(:send_message) do
    message = :nitro.q(:message)
    case message do
       "" -> :ok;
       _ ->
        room = :n2o.session(:room)
        :n2o.send({:room, room}, N2O.client(data: message))
    end
  end
  def event({:client, message}) do
    :nitro.wire(
      NITRO.jq(
        target: :message,
        method: [:focus, :select]
      )
    )
    :nitro.insert_top(
      :message_list,
      :nitro.render(
        NITRO.panel(
          body: [
            NITRO.message(body: message),
            NITRO.br()
          ]
        )
      )
    )
  end
  def event({:exit, _}) do
    :n2o.unreg({:room, :n2o.session(:room)})
  end
  def event(event), do: IO.inspect(event);
end
