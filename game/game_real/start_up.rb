def start_up

    start_up_variabel
    start_up_things
    start_up_text
    start_up_tid

end

def start_up_variabel

    @restart_button_size = 100

    SONG.loop = true
    SONG.play

    @game_status = 1
    
    @restart_game = false
    @info_status = false

    @max_score1 = 1
    @max_score2 = 1

    @liv = 3

    @radius_angry_balls = 10

    @score = 0

end

def start_up_things

    @heart_size = 40
    @heart1 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
    @heart2 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
    @heart3 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)

    @restart_button_0 = Image.new('filer/restart.png',  width: 20, height: 20, x: 2, y: 2, z:100)

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

    balls
    
end

def start_up_text

    @font = 'filer/text.ttf'
    @text_size = 40
    @score_text_x = 1061
    @score_text_y = 60
    @text_color = 'yellow'

    @text = Text.new(
        "#{@score}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
    )

end

def start_up_tid

    @time = Time.now.to_i
    @tid_screen = 0
    @tid_udda_eller_even = true
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - 20,
        y: 25,
        font: @font,
        size: 40,
        color: @text_color,
        z:100
    )

end