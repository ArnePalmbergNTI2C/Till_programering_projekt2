def when_update_level_2
    
    @text.remove
    @score2 = 0
    @liv = 3
    @sprite.add
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @sprite.y = ((@square_size - @sprite_storlek) / 2)
    @mol.add
    @start.add
    @mol.x = Window.width - @square_size
    @mol.y = Window.height - @square_size
    @start.x = 0
    @start.y = 0
    @restart_button_1.remove
    @restart_button_2.remove
    @restart_button_3.remove
    @restart_game = false
    @heart1.add
    @heart2.add
    @heart3.add
    @text = Text.new(
        "#{@score2}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
    )
    maxspeed = 20
    minstspeed = 15
    @balls = [
        Red_balls.new(10, 0, 100, rand(minstspeed..maxspeed), @game_status, 10),
        Red_balls.new(Window.width-10, 0, 150, rand(-maxspeed..-minstspeed), @game_status, 10),
        Red_balls.new(10, 0, 200, rand(minstspeed..maxspeed), @game_status, 10),
        Red_balls.new(Window.width-10, 0, 250, rand(-maxspeed..-minstspeed), @game_status, 10),
        Red_balls.new(10, 0, 300, rand(minstspeed..maxspeed), @game_status, 10),                
        Red_balls.new(Window.width-10, 0, 350, rand(-maxspeed..-minstspeed), @game_status,10),
        Red_balls.new(10, 0, 400, rand(minstspeed..maxspeed), @game_status, 10),                
        Red_balls.new(Window.width-10, 0, 450, rand(-maxspeed..-minstspeed), @game_status, 10),
        Red_balls.new(10, 0, 500, rand(minstspeed..maxspeed), @game_status, 10),                
        Red_balls.new(Window.width-10, 0, 550, rand(-maxspeed..-minstspeed), @game_status, 10),
        Red_balls.new(10, 0, 600, rand(minstspeed..maxspeed), @game_status, 10),                 
    ]

end