def info
    if @info_status == false

        @time_status = Time.now.to_i - @time

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

    else 

        @info_status = false

        @x_info_button.remove
        @info_square.remove

        @time = Time.now.to_i - @time_status 

    end
    
end
