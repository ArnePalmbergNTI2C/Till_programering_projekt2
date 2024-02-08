def when_game_reset

    game_reset_remove
    game_reset_add
    game_reset_variabel
    game_reset_position
    game_reset_info


end


def game_reset_remove
    if @restart_game == true

        @restart_button.remove
        @restart_game = false

    else
        
        @balls.each do |red_balls|
            red_balls.angry_balls.remove
        end

        @sprite.remove
        @mol.remove
        @start.remove

        @heart1.remove
        @heart2.remove
        @heart3.remove

        case @game_status
        when 4 
            SONG2.stop
            @win_image.remove

        when 3
            @rectangle1.remove
            @rectangle2.remove
        end

    end

end

def game_reset_add

    tid_reset
    SONG.play
    score_text_reset

    @heart1.add
    @heart2.add
    @heart3.add

    @sprite.add

    if @game_status > 2

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

    else

        @mol.add
        @start.add

    end

end

def game_reset_variabel

    @game_status = 1
    @liv = 3
    @score = 0
    
    balls

end


def game_reset_position

    @heart1.x = (Window.width - (@heart_size * 1) - 10)
    @heart1.y = 10
    @heart2.x = (Window.width - (@heart_size * 2) - 20)
    @heart2.y = 10
    @heart3.x = (Window.width - (@heart_size * 3) - 30)
    @heart3.y = 10

    @start.x = 0
    @start.y = ((Window.height / 2 ) - @square_size / 2 )

    @mol.x = Window.width - @square_size
    @mol.y = ((Window.height / 2 ) - @square_size / 2 )
    
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

end

def game_reset_info

    if @info_status == true
        @info_square.remove
        @info_status = false
    end

end