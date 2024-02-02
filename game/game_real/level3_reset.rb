def when_update_level_3
    
    @liv = 3
    @sprite.add
    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
    @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))
    @mol.add
    @start.add
    @square1.add
    @square2.add
    @restart_button_1.remove
    @restart_button_2.remove
    @restart_button_3.remove
    @restart_game = false
    @heart1.add
    @heart2.add
    @heart3.add
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