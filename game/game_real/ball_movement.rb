def ball_movement

    if @game_status == 1

        if hit1
            @y_speed = -@y_speed
        end
        @angry_balls.y = (@angry_balls.y + @y_speed)
    elsif @game_status == 2

        if hit2
            @x_speed = -@x_speed
        end
        @angry_balls.x = (@angry_balls.x + @x_speed)

    elsif @game_status == 3
        if hit3
            @y_speed = -@y_speed
        end
        @angry_balls.y = (@angry_balls.y + @y_speed)
    end
    
end

def hit1
    if @y_speed >= 0
    
        @angry_balls.y + 10 >= Window.height
    else
        @angry_balls.y - 10 <= 0
    end

end

def hit2
    if @x_speed >= 0
    
        @angry_balls.x + 10 >= Window.width
    else
        @angry_balls.x - 10 <= 0
    end

end

def hit3
    if @y_speed >= 0
    
        @angry_balls.y + 10 >= Window.height - 250
    else
        @angry_balls.y - 10 <= 250
    end

end

