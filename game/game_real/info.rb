def info
    if @info_status == false

        @time_status = Time.now.to_i - @time

        @info_square = Square.new(
            x: Window.width / 2,
            y: Window.height / 2,
            size: 400,
            color: 'green',
            z: 100000
        )

        case @game_status
        when 1
            @sprite.x = ((@square_size - @sprite_storlek) / 2)
            @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
        when 2
            @sprite.x = ((@square_size - @sprite_storlek) / 2)
            @sprite.y = ((@square_size - @sprite_storlek) / 2)
        when 3
            @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
            @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))        
        end

        @info_status = true

    else 

        @info_status = false

        @info_square.remove

        @time = Time.now.to_i - @time_status 

    end
    
end
