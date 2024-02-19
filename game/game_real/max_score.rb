def when_max_score
    
    if @score == @max_score1 && @game_status == 1
        when_max_score_1
    elsif @score == @max_score2 && @game_status == 2
        when_max_score_2
    end

end

def when_max_score_1

    when_max_score_1_variabel
    when_max_score_1_remove
    when_max_score_1_position
    when_max_score_1_add

    score_text_reset

end


def when_max_score_1_variabel

    @game_status = 2
    @liv = 3
    @score = 0

end

def when_max_score_1_remove

    @heart1.remove
    @heart2.remove
    @heart3.remove

    @balls.each do |red_balls|
        red_balls.angry_balls.remove
    end
    

end

def when_max_score_1_position

    @heart1.x = (Window.width - (@heart_size * 1) - 10)
    @heart1.y = 10
    @heart2.x = (Window.width - (@heart_size * 2) - 20)
    @heart2.y = 10
    @heart3.x = (Window.width - (@heart_size * 3) - 30)
    @heart3.y = 10

    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @sprite.y = ((@square_size - @sprite_storlek) / 2)
    @mol.x = Window.width - @square_size
    @mol.y = Window.height - @square_size
    @start.x = 0
    @start.y = 0
    
end


def when_max_score_1_add

    SUCCESS.play

    @heart1.add
    @heart2.add
    @heart3.add
    @mol.add
    @start.add
    @sprite.add

    balls

end

def when_max_score_2

    when_max_score_2_variabel
    when_max_score_2_remove
    when_max_score_2_position
    when_max_score_2_add

end

def when_max_score_2_variabel

    @game_status = 3

end

def when_max_score_2_remove

    @text.remove

    @heart1.remove
    @heart2.remove
    @heart3.remove

    @start.remove
    @mol.remove

    @balls.each do |red_balls|
        red_balls.angry_balls.remove
    end

end

def when_max_score_2_position

    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
    @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

end

def when_max_score_2_add

    SUCCESS.play

    @sprite.add

    @mol = Rectangle.new(
        x: 0, y: 0,
        width: @square_size, height: (@square_size * 2),
        color: 'green',
        z: 0
    )
    @start = Rectangle.new(
        x: (Window.width - @square_size), y: Window.height - (@square_size * 2),
        width: @square_size, height: (@square_size * 2),
        color: 'white',
        z: 0
    )

    @rectangle1 = Rectangle.new(
        x: 0, y: 100,
        width: 900, height: 150,
        color: 'red',
        z: 0
    )
    @rectangle2 = Rectangle.new(
        x: Window.width - 900, y: Window.height - 250,
        width: 900, height: 150,
        color: 'red',
        z: 0
    )

    balls

end