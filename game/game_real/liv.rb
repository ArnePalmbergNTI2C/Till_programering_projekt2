def antal_liv
    if @game_status != 3

        case @liv
        when 2
            @heart3.remove
        when 1
            @heart2.remove
        when 0
            inga_liv
        end

    end

end

def inga_liv

    @liv -= 1
    @restart_button = Image.new(
        'filer/restart.png',
        width: @restart_button_size,
        height: @restart_button_size,
        x: ((Window.width / 2) - (@restart_button_size / 2)),
        y: ((Window.height / 2) - (@restart_button_size / 2))
    )

    @restart_game = true    

    @heart1.remove
    @sprite.remove
    @mol.remove
    @start.remove
    @text.remove
    @balls.each do |red_balls|
        red_balls.angry_balls.remove
    end

end