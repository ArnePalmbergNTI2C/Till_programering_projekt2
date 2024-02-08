def when_update_level_2
    variabel_when_update_level_2
    remove_when_update_level_2
    position_when_update_level_2
    add_when_update_level_2
    balls_when_update_level_2

    score_text_reset
end

def variabel_when_update_level_2

    @score = 0
    @liv = 3
    @restart_game = false

end

def remove_when_update_level_2

    @restart_button.remove

end

def position_when_update_level_2

    @mol.x = Window.width - @square_size
    @mol.y = Window.height - @square_size
    @start.x = 0
    @start.y = 0
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @sprite.y = ((@square_size - @sprite_storlek) / 2)

end

def add_when_update_level_2
    @sprite.add
    @mol.add
    @start.add
    @heart1.add
    @heart2.add
    @heart3.add

end


def balls_when_update_level_2

    balls

end
