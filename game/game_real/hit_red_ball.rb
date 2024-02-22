#detta är en funktion som körs hela tiden. 
#det händer grejer om någon av bollarna nuddar spriten. detta genom att kolla spriten och bollens x och y värden
#bollens x och y värden är i mitten så om man bara kollar om bollens x och y värden finns i spriten kommer bollens hitbox vara jätteliten
#därför kollar denna funktion om någon av 4 punkter av bollens x och y värden finns i spriten. alltså till vänster,upp,ner och höger
#sen ska lite olika saker hända beronde på game_status/level

def when_hit_red_ball
    @balls.each do |red_balls|
        if @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y + @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x,red_balls.angry_balls.y - @radius_angry_balls or @sprite.contains? red_balls.angry_balls.x - @radius_angry_balls,red_balls.angry_balls.y or @sprite.contains? red_balls.angry_balls.x + @radius_angry_balls,red_balls.angry_balls.y

            HIT.play

            case @game_status
            #om level är 1 ska liv minska, ny score text och spriten byta plats
            when 1

                @liv -=1
                score_text_reset #funktion i filen score_text.rb

                if @score % 2 == 0

                    @sprite.x = ((@square_size - @sprite_storlek) / 2)
                    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                    
                else
                    
                    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

                end

            #om level är 2 ska liv minska, ny score text och spriten byta plats
            when 2

                @liv -=1
                score_text_reset #funktion i filen score_text.rb
                
                if @score % 2 == 0

                    @sprite.x = ((@square_size - @sprite_storlek) / 2)
                    @sprite.y = ((@square_size - @sprite_storlek) / 2)  
                    
                else
                    
                    @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                    @sprite.y = ((Window.height  - @square_size) + ((@square_size - @sprite_storlek) / 2))

                end
                
            #om level är 3 ska spriten byta plats
            when 3

                @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

            end
        end
    end
end