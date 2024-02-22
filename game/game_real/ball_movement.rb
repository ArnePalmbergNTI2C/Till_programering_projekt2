#detta är en funktion som körs hela tiden. 
#om game_status/level är 1-3 ska grejer hända 
#beronde på game_status/level ska olika saker hända
#hela tiden ska angry_balls/röda bollarna ändra position. på level 1 och 3 i y led och på level 2 i x led.
#y_speed och x_speed får dem när dom skapas. (syns i filen balls.rb och main.rb)
#om hit1, hit2 eller hit3 är true kommer y_speed eller x_speed att bli negativt om det var positivt och positivt om det var negativt. byter tecken liksom
#detta betyder att det studasr upp och ner eller från sida till sida

def ball_movement

    case @game_status
    when 1
        if hit1
            @y_speed = -@y_speed
        end
        @angry_balls.y = (@angry_balls.y + @y_speed)
    when 2
        if hit2
            @x_speed = -@x_speed
        end
        @angry_balls.x = (@angry_balls.x + @x_speed)
    when 3
        if hit3
            @y_speed = -@y_speed
        end
        @angry_balls.y = (@angry_balls.y + @y_speed)
    end
    
end

#hit1 är true om y positionen på bollen nuddar taket eller marken.
def hit1

    if @y_speed >= 0
    
        @angry_balls.y + 10 >= Window.height
    else
        @angry_balls.y - 10 <= 0
    end

end

#hit2 är true om x positionen på bollen nuddar någon vägg
def hit2

    if @x_speed >= 0
    
        @angry_balls.x + 10 >= Window.width
    else
        @angry_balls.x - 10 <= 0
    end

end

#hit3 är true om y positionen på bollen nuddar de y värden där de 2 rektanglarna är. 
#(man skulle kunna använt contains? men detta fungerade också och jag orkade inte :).
def hit3
    
    if @y_speed >= 0
    
        @angry_balls.y + 10 >= Window.height - 250
    else
        @angry_balls.y - 10 <= 250
    end

end

