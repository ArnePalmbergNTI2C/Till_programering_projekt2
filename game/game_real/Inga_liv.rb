
    
def inga_liv
    if @liv == 2 
        @heart3.remove

    elsif @liv == 1
        @heart2.remove
    elsif @liv == 0
        @liv -= 1
        @heart1.remove
        @sprite.remove
        @mol.remove
        @start.remove
        @text.remove
        @balls.each do |red_balls|
            red_balls.angry_balls.remove
        end
        @restart_game = true
        if @score2 >= 0 && @game_status < 3
            @restart_button_3 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_2 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: ((Window.width / 2) - (@restart_button_size / 2)), y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_1 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
        elsif @score2 == -1 && @game_status < 3
            @restart_button_3 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_2 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_1 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: ((Window.width / 2) - (@restart_button_size / 2)), y: ((Window.height / 2) - (@restart_button_size / 2)))
        else
            @rectangle1.remove
            @rectangle2.remove
            @restart_button_3 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: ((Window.width / 2) - (@restart_button_size / 2)), y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_2 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
            @restart_button_1 = Image.new('filer/restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
        end
        
        @balls = []
    end

end