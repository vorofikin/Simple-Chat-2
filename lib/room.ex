defmodule Room do
  use N2O
  require NITRO

  def event(:init) do
    room = N2O.session(:room)
    key = {:room, room}
    N2O.reg(key)
    :nitro.update(:send, NITRO.button(
      id: :send,
      body: "Send Message",
      postback: :send_message,
      source: [:message]
    ))
  end
  def event(:send_message) do
    message = :nitro.q(:message)
    case message do
       "" -> :ok;
       _ ->
        room = N2O.session(:room)
        N2O.send({:room, room}, NITRO.client(data: message))
    end
  end
  def event({:client, message}) do
    NITRO.wire(
      NITRO.jq(
        target: :message,
        method: [:focus, :select]
      )
    )
    :nitro.insert_bottom(
      :message_list,
      :nitro.render(NITRO.panel(
        body: [NITRO.message(body: message), NITRO.br()]
      ))
    )
    # NITRO.insert_top(
    #   :message_list,
    #   NITRO.render(
    #     NITRO.panel(
    #       body: [
    #         NITRO.message(body: message),
    #         NITRO.br()
    #       ]
    #     )
    #   )
    # )
  end
  def event(_event), do: :ok
end
