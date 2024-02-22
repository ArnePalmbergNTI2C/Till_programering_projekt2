#den här funktionen fixar info skärmen
#när i klickas eller en liten info knapp klickas körs denna funktionen. 
#om @info_status är false öppnas info skärmen. om den är true stängs info skärmen. men om den är true blir den false så att nästa gång något klickas är den false. samma om den va false först blir den true.
#så korfattat blir det att när något klickas öppnas den och sen klickas igen stängs den 

#denna funktionen gör också så att den totala tiden för rundan pausar om infoskärmen är öppen

def info
    #när den är false alltså info skärmen inte öppen ska lite saker skapas
    if @info_status == false

        @time_status = Time.now.to_i - @time #kommer ihåg tiden när den infoskärmen öppnades

        @info_square = Image.new(
            'filer/info.png',
            width: 800,
            height: 600,
            x: (Window.width / 2) - (@info_square.width / 2),
            y: (Window.height / 2) - (@info_square.height / 2),
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

        #när info skärmen öppnas sätt spritens position till starten beronde på game_status/level. 
        case @game_status
        when 1
            
            if @score % 2 == 0

                @sprite.x = ((@square_size - @sprite_storlek) / 2)
                @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                
            else
                
                @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

            end

        when 2

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

        @info_status = true
    #när info skärmen ska tas bort ska lite saker tas bort
    else 

        @x_info_button.remove
        @info_square.remove

        @time = Time.now.to_i - @time_status #gör så att tiden forsätter från när infoskärmen öppnades senast

        @info_status = false

    end
    
end
