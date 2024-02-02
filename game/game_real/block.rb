def when_hit_block    
    if @square1.contains? @sprite.x + (@sprite_storlek / 2), @sprite.y or @square1.contains? @sprite.x + @sprite_storlek, @sprite.y + (@sprite_storlek / 2) or @square1.contains? @sprite.x, @sprite.y + (@sprite_storlek / 2) or @square1.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek or  @square2.contains? @sprite.x + (@sprite_storlek / 2), @sprite.y or @square2.contains? @sprite.x + @sprite_storlek, @sprite.y + (@sprite_storlek / 2) or @square2.contains? @sprite.x, @sprite.y + (@sprite_storlek / 2) or @square2.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek
         
        @liv -=1
        HIT.play
        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
        @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))

    end
end