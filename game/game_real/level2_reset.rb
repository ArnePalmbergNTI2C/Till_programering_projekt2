def when_update_level_2
    variabel_when_update_level_2
    remove_when_update_level_2
    position_when_update_level_2
    add_when_update_level_2
    balls_when_update_level_2

end

def variabel_when_update_level_2

    @score2 = 0
    @liv = 3
    @restart_game = false


end

def remove_when_update_level_2

    @text.remove
    @restart_button_1.remove
    @restart_button_2.remove
    @restart_button_3.remove


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
    @text = Text.new(
        "#{@score2}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
    )

end


def balls_when_update_level_2
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
