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

    @restart_button_1.remove
    @restart_button_2.remove
    @restart_button_3.remove

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
    @heart1.add
    @heart2.add
    @heart3.add

end


def balls_when_update_level_3
    speed = 3
    @balls = [
        Red_balls.new(250, -speed, 450, 0, @game_status, 8),
        Red_balls.new(300, speed, 250, 0, @game_status, 8),
        Red_balls.new(350, -speed, 450, 0, @game_status, 8),
        Red_balls.new(400, speed, 250, 0, @game_status, 8),
        Red_balls.new(450, -speed, 450, 0, @game_status, 8),
        Red_balls.new(500, speed, 250, 0, @game_status, 8),
        Red_balls.new(550, -speed, 450, 0, @game_status, 8),
        Red_balls.new(600, speed, 250, 0, @game_status, 8),
        Red_balls.new(650, -speed, 450, 0, @game_status, 8),
        Red_balls.new(700, speed, 250, 0, @game_status, 8),
        Red_balls.new(750, -speed, 450, 0, @game_status, 8),
        Red_balls.new(800, speed, 250, 0, @game_status, 8),
        Red_balls.new(850, -speed, 450, 0, @game_status, 8),
    ]

end