def start_up
    @restart_button_0 = Image.new('filer/restart.png',  width: 20, height: 20, x: 5, y: 5, z:100)
    @square1 = Rectangle.new(
            x: -500, y: 0,
            width: 1, height: 1,
        )
    @square2 = Rectangle.new(
        x: -500, y: 0,
        width: 10, height: 1,
    )
    SONG.loop = true
    SONG.play
    @game_status = 1

    @font = 'filer/text.ttf'
    @text_size = 40
    @score_text_x = 1058
    @score_text_y = 60
    @text_color = 'yellow'
    
    @restart_game = false

    @max_score1 = 5
    @max_score2 = 5
    @liv = 3

    @radius_angry_balls = 10

    @score = 0
    @score2 = -1

    @heart_size = 40
    @heart1 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
    @heart2 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
    @heart3 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
    
    @restart_button_size = 100
    
    @text = Text.new(
        "#{@score}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
    )
    @square_size = 50
    @start = Square.new(
        x: 0,
        y: ((Window.height / 2 ) - @square_size / 2 ),
        size: @square_size,
        color: 'white',
        z: 0
    )
    @mol = Square.new(
        x: Window.width - @square_size,
        y: ((Window.height / 2 ) - @square_size / 2 ),
        size: @square_size,
        color: 'green',
        z: 0
    )
    @sprite_storlek = 25
    @sprite = Sprite.new('filer/hero.png', clip_width: 214, height: @sprite_storlek, width: @sprite_storlek, y: ((Window.height / 2 ) - @sprite_storlek / 2 ), x: ((@square_size - @sprite_storlek) / 2), z: 2)
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