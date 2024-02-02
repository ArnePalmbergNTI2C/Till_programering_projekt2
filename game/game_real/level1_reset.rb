def when_update_level_1    
    @restart_button_1.remove
    @restart_button_2.remove
    @restart_button_3.remove
    @text.remove
    @score = 0
    @score2 = -1
    @liv = 3
    @sprite.add
    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @mol.add
    @mol.x = Window.width - @square_size
    @mol.y = ((Window.height / 2 ) - @square_size / 2 )
    @start.add
    @start.x = 0
    @start.y = ((Window.height / 2 ) - @square_size / 2 )
    @restart_game = false
    @heart1.add
    @heart2.add
    @heart3.add
    @text = Text.new(
        "#{@score}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
    )
    maxspeed = 10
    minstspeed = 5 
    @balls = [
        Red_balls.new(100, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(150, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(200, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(250, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(300, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(350, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(400, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(450, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(500, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(550, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(600, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(650, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(700, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(750, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(800, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(850, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(900, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),
        Red_balls.new(950, rand(-maxspeed..-minstspeed), Window.height-10, 0, @game_status, 10),
        Red_balls.new(1000, rand(minstspeed..maxspeed), 10, 0, @game_status, 10),

        
    ]
end