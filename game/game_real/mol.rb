def when_hit_mol
    if @mol.contains? @sprite.x + @sprite_storlek / 2 ,@sprite.y or @mol.contains? @sprite.x, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek / 2, @sprite.y + @sprite_storlek
        @text.remove
        if @game_status < 3
            if @score + 1 != @max_score1 or @score2 +1 != @max_score2
                SMALL_SUCCESS.play
            end
            if @score2 >= 0
                @score2 +=1
                if @score2 % 2 == 0
                    @start.x = 0 
                    @start.y = 0
                    @mol.x = Window.width - @square_size
                    @mol.y = Window.height - @square_size
                    
                else
                    @start.x = Window.width - @square_size
                    @start.y = Window.height - @square_size
                    @mol.x = 0
                    @mol.y = 0
                end

                @text = Text.new(
                    "#{@score2}",
                    x: @score_text_x,
                    y: @score_text_y,
                    font: @font,
                    size: @text_size,
                    color: @text_color,
                    )  
            else
                @score +=1
        
                if @score % 2 == 0
                    @start.x = 0 
                    @mol.x = Window.width - @square_size
                    
                else
                    @start.x = Window.width - @square_size
                    @mol.x = 0
                end
                @text = Text.new(
                    "#{@score}",
                    x: @score_text_x,
                    y: @score_text_y,
                    size: @text_size,
                    font: @font,
                    color: @text_color,
                )
            end
        elsif @game_status == 3
            @win_image = Image.new('filer/win.jpg', x: 0, y:0, width: 1100, height: 700)
            @square1.remove
            @square2.remove
            SONG.stop
            SONG2.loop = true
            SONG2.play
            @heart1.remove
            @heart2.remove
            @heart3.remove
            @sprite.remove
            @mol.remove
            @start.remove
            @text.remove
            @balls.each do |red_balls|
                red_balls.angry_balls.remove
            end
            @game_status += 1
        end

    end
end