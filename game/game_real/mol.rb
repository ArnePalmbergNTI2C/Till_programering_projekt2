#denna funktion körs hela tiden från update do loopen
#om den gröna mål rutan innehåller spritens x och y värden ska saker hända
#spritens x och y värden är längs upp till vänster så om man bara kollar om spritens x och y värden finns i målet kommer spritens hitbox vara jätteliten och fel
#därför kollar denna funktion om någon av 4 punkter av spritens x och y värden finns i målet. alltså till vänster,upp,ner och höger
#sen ska lite olika saker hända beronde på game_status/level

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

#Om man träffar mål och game_status är 1 eller 2 ska denna funktions köras
#om man inte har  full poäng på en level alltså maxscore ska saker hände
#sen beronde på game_status/level körs nya funktioner
def mol_game_status_mindre_3

    if @score != @max_score1 or @score != @max_score2

        SMALL_SUCCESS.play
        @score +=1
        score_text_reset #funktion i score_text.rb            

        case @game_status
        when 2
            game_status_mindre_3_status_2
        when 1
            game_status_mindre_3_status_1
        end
    end

end

#Om man är på level 2, ska start och mål byta plats 
#detta genom att kolla om score är delbart med 2.
#om score är jämnt tal ska start vara uppe vänster och mol längs nere till höger
def game_status_mindre_3_status_2

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

#Om man är på level 1 ska start och mål byta plats 
#detta genom att kolla om score är delbart med 2.
#om score är jämnt tal ska start vara vänster och mol till höger
def game_status_mindre_3_status_1

    if @score % 2 == 0
        @start.x = 0 
        @mol.x = Window.width - @square_size
        
    else
        @start.x = Window.width - @square_size
        @mol.x = 0
    end
    

end

#om game_status/level är 3 ska denna funktion köras
def mol_game_status_3

    status_3_mol_variabel
    status_3_mol_remove
    status_3_mol_add

end

#variablar ändras
def status_3_mol_variabel
    SONG2.loop = true
    @game_status += 1
end

#saker tas bort
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

#saker läggs till
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