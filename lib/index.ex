defmodule Index do
  require NITRO;
  require N2O;

  @room_number 3

  def event(:init) do
    button_elements = Enum.map(1..@room_number, fn button ->
      button_num = Integer.to_string(button)
      NITRO.button(
        id: "room" <> button_num,
        body: "Кімната " <> button_num,
        postback: {:go_to_room, button}
      )
    end)
    :nitro.insert_bottom(:heading, NITRO.panel(
      id: "buttons",
      body: button_elements
    ))
  end
  def event({:go_to_room, room}) do
    room_binary = :nitro.to_binary(room)
    :n2o.session(:room, room)
    :nitro.redirect(["/app/room.htm?room=", room_binary])
  end
  def event(event), do: IO.inspect(event);
end
