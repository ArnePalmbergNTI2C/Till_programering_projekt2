#denna funktion körs när programmet startar upp
def start_up

    start_up_variabel
    start_up_things
    start_up_text
    start_up_tid
    start_up_info

end

#varibler skapas och sätts till något
def start_up_variabel

    @restart_button_size = 100

    @game_status = 1
    
    @restart_game = false
    @info_status = true

    @max_score1 = 5
    @max_score2 = 5

    @liv = 3

    @radius_angry_balls = 10

    @score = 0

end

#saker skapas
def start_up_things

    SONG.loop = true


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

    balls #kör en funktion i filen balls.rb
    
end

#sätter lite varibler till en text och sen skapar en text som visar sin score
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
        z: 100
    )

end

#tiden som visas på skärmen
#variabler får värden och en text visas
def start_up_tid

    @text_tid_y = 25
    @text_tid_size = 40

    @time = Time.now.to_i
    @tid_screen = 0
    @tid_udda_eller_even = true
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - (@text_tid_size / 2),
        y: @text_tid_y,
        font: @font,
        size: @text_tid_size,
        color: @text_color,
        z:100
    )


end

#info skärmen skapas
#info skäremn ska vara öppen när programmet startar
def start_up_info 

    @time_status = Time.now.to_i - @time #behövs då info skärmen är öppen när programmet startar

    @info_screen_width = 800
    @info_screen_height = 600
    @x_info_button_width = 25
    @x_info_button_height = 25

    @info_square = Image.new(
        'filer/info.png',
        width: @info_screen_width,
        height: @info_screen_height,
        x: (Window.width / 2) - (@info_screen_width / 2),
        y: (Window.height / 2) - (@info_screen_height / 2),
        z: 100000,
    )
    @x_info_button = Image.new(
        'filer/x.png',
        width: @x_info_button_height,
        height: @x_info_button_height,
        x: Window.width - ((Window.width - @info_screen_width) / 2) - (@x_info_button_width / 2),
        y: ((Window.height - @info_screen_height) / 2) - (@x_info_button_height / 2),
        z:10000000000000000
    )
    
    @info_button = Image.new(
        'filer/Info_button.png',
        width: 20,
        height: 20,
        x: 25,
        y: 2,
        z:100
    )

end