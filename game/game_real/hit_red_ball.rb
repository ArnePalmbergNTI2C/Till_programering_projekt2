def when_hit_red_ball
    @balls.each do |red_balls|
        if @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y + @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y - @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x - @radius_angry_balls,red_balls.angry_balls.y or @sprite.contains? red_balls.angry_balls.x + @radius_angry_balls,red_balls.angry_balls.y
            @text.remove
            @liv -=1
            HIT.play

            if @game_status < 3

                if @score2 >= 0 
                    @text = Text.new(
                        "#{@score2}",
                        x: @score_text_x,
                        y: @score_text_y,
                        size: @text_size,
                        font: @font,
                        color: @text_color,
                    )
                    
                    if @score2 % 2 == 0

                        @sprite.x = ((@square_size - @sprite_storlek) / 2)
                        @sprite.y = ((@square_size - @sprite_storlek) / 2)  
                        
                    else
                        
                        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                        @sprite.y = ((Window.height  - @square_size) + ((@square_size - @sprite_storlek) / 2))

                    end

                else
                    
                    @text = Text.new(
                    "#{@score}",
                    x: @score_text_x,
                    y: @score_text_y,
                    size: @text_size,
                    font: @font,
                    color: @text_color,
                    )

                    if @score % 2 == 0

                        @sprite.x = ((@square_size - @sprite_storlek) / 2)
                        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                        
                    else
                        
                        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

                    end
                end
            else

                @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

            end
        end
    end
end