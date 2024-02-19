def when_hitt_mol
    if @mol.contains? @sprite.x + @sprite_storlek / 2 ,@sprite.y or @mol.contains? @sprite.x, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek / 2, @sprite.y + @sprite_storlek
        case @game_status
        when 1..2
            mol_game_status_mindre_3
        when 3
            mol_game_status_3
        end
    end
end

def mol_game_status_mindre_3

    if @score + 1 != @max_score1 or @score + 1 != @max_score2
        SMALL_SUCCESS.play
    end
    @score +=1
    score_text_reset

    case @game_status
    when 2
        game_status_mindre_3_status_2
    when 1
        game_status_mindre_3_status_1
    end


end

def game_status_mindre_3_status_2

    if @game_status == 2 && @score != @max_score1 or @score != @max_score2
        if @score % 2 == 0
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

    end 
    
end

def game_status_mindre_3_status_1

    if @game_status == 1 && @score != @max_score1 or @score != @max_score2
        if @score % 2 == 0
            @start.x = 0 
            @mol.x = Window.width - @square_size
            
        else
            @start.x = Window.width - @square_size
            @mol.x = 0
        end
    end

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

    SONG.stop
    
    @text_tid.remove

end

def status_3_mol_add

    SUCCESS.play
    SONG2.play
    @win_image = Image.new(
        'filer/win.jpg',
        x: 0,
        y: 0,
        width: Window.width, 
        height: Window.height, 
        z:75
    )
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