def when_hit_mol
    if @mol.contains? @sprite.x + @sprite_storlek / 2 ,@sprite.y or @mol.contains? @sprite.x, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek / 2, @sprite.y + @sprite_storlek
        if @game_status < 3
            mol_game_status_mindre_3
        elsif @game_status == 3
            mol_game_status_3
        end
    end
end

def mol_game_status_mindre_3

    @text.remove
    if @score + 1 != @max_score1 or @score2 + 1 != @max_score2
        SMALL_SUCCESS.play
    end

    if @game_status == 2
        if @score2 >= 0
            game_status_mindre_3_status_2
        else
            game_status_mindre_3_status_1
        end
    end

end

def game_status_mindre_3_status_2

    @score2 +=1

    if @game_status == 1

        if @score2 % 2 == 0
            @start.x = 0 
            @start.y = 0
            @mol.x = Window.width - @square_size
            @mol.y = Window.height - @square_size
            
        else
            @start.x = Window.width - @square_size
            @start.y = Window.height - @square_size
            @mol.x = 0
            @mol.y = 0
        end

        @text = Text.new(
            "#{@score2}",
            x: @score_text_x,
            y: @score_text_y,
            font: @font,
            size: @text_size,
            color: @text_color,
        ) 
    end 
    
end

def game_status_mindre_3_status_1

    @score +=1


    if @score % 2 == 0
        @start.x = 0 
        @mol.x = Window.width - @square_size
        
    else
        @start.x = Window.width - @square_size
        @mol.x = 0
    end
    @text = Text.new(
        "#{@score}",
        x: @score_text_x,
        y: @score_text_y,
        size: @text_size,
        font: @font,
        color: @text_color,
    )
end

def mol_game_status_3

    status_3_mol_variabel
    status_3_mol_remove
    status_3_mol_add

end

def status_3_mol_variabel
    SONG2.loop = true
    @game_status += 1
end

def status_3_mol_remove

    @balls.each do |red_balls|
        red_balls.angry_balls.remove
    end
    @rectangle1.remove
    @rectangle2.remove
    @heart1.remove
    @heart2.remove
    @heart3.remove
    @sprite.remove
    @mol.remove
    @start.remove
    @text.remove
    SONG.stop
    @text_tid.remove

end

def status_3_mol_add

    SONG2.play
    @win_image = Image.new('filer/win.jpg', x: 0, y:0, width: 1100, height: 700, z:75)
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - 50,
        y: (Window.height / 2) + 175,
        font: @font,
        size: 100,
        color: @text_color,
        z:100
    )  
end