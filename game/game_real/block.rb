def when_hit_block    
    if @game_status == 3
        if @rectangle1.contains? @sprite.x + (@sprite_storlek / 2), @sprite.y or @rectangle1.contains? @sprite.x + @sprite_storlek, @sprite.y + (@sprite_storlek / 2) or @rectangle1.contains? @sprite.x, @sprite.y + (@sprite_storlek / 2) or @rectangle1.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek or  @rectangle2.contains? @sprite.x + (@sprite_storlek / 2), @sprite.y or @rectangle2.contains? @sprite.x + @sprite_storlek, @sprite.y + (@sprite_storlek / 2) or @rectangle2.contains? @sprite.x, @sprite.y + (@sprite_storlek / 2) or @rectangle2.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek
            HIT.play
            @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
            @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))
        end
    end
end