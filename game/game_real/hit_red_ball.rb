def when_hit_red_ball
    @balls.each do |red_balls|
        if @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y + @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y - @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x - @radius_angry_balls,red_balls.angry_balls.y or @sprite.contains? red_balls.angry_balls.x + @radius_angry_balls,red_balls.angry_balls.y

            HIT.play

            case @game_status
            when 1

                @liv -=1
                score_text_reset

                if @score % 2 == 0

                    @sprite.x = ((@square_size - @sprite_storlek) / 2)
                    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                    
                else
                    
                    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

                end

            when 2

                @liv -=1
                score_text_reset
                
                if @score % 2 == 0

                    @sprite.x = ((@square_size - @sprite_storlek) / 2)
                    @sprite.y = ((@square_size - @sprite_storlek) / 2)  
                    
                else
                    
                    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                    @sprite.y = ((Window.height  - @square_size) + ((@square_size - @sprite_storlek) / 2))

                end
                
            when 3

                @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

            end
        end
    end
end