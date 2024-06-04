defmodule Index do
  use N2O, with: [:n2o, :nitro]

  @room_number 3

  def event(:init) do
    button_elements = Enum.map(1..@room_number, fn button ->
      button_num = Integer.to_string(button)
      button(
        id: "room" <> button_num,
        body: "Кімната " <> button_num,
        postback: [:go_to_room, button]
      )
    end)

    :nitro.insert_bottom(:heading, panel(
      id: "buttons",
      body: button_elements
    ))
  end
  def event({:go_to_room, room}) do
    room_string = Integer.to_string(room)
    # n2o_session(:room, room)
    N2O.session(:room, room)
    :nitro.redirect("/app/room.htm?room=" <> room_string)
  end
  def event(_event), do: :ok
end
