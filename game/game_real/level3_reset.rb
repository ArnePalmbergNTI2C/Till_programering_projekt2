def when_update_level_3
    variabel_when_update_level_3
    remove_when_update_level_3
    position_when_update_level_3
    add_when_update_level_3
    balls_when_update_level_3

end

def variabel_when_update_level_3

    @liv = 3
    @restart_game = false

end

def remove_when_update_level_3

    @restart_button.remove

end

def position_when_update_level_3

    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
    @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

end

def add_when_update_level_3
   
    @sprite.add
    @mol.add
    @start.add
    @rectangle1.add
    @rectangle2.add

end


def balls_when_update_level_3

    balls

end