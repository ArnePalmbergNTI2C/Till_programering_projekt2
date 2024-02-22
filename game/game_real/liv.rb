#denna funktion körs hela tiden från update do loopen
#om game_status/level är mindre än 3 alltså att man är på level 1 eller 2 ska grejer hända
#Beroende på liv ska olika saker hända
#om liv är 2 ska ett hjärta tas bort
#om liv är 1 ska ett till hjärta tas bort
#om liv är 0 startar en funktion längre ner i filen
def antal_liv
    if @game_status < 3

        case @liv
        when 2
            @heart3.remove
        when 1
            @heart2.remove
        when 0
            inga_liv
        end

    end

end

#om liv är noll ska liv minska en till bara för att funktionen endast ska köras en gång
#allt som syntes ska försvinna
#en restartbutton ska skapas 
#restart_game = true för att bland annat göra så man inte kan röra sig 

def inga_liv

    @liv -= 1
    @restart_button = Image.new(
        'filer/restart.png',
        width: @restart_button_size,
        height: @restart_button_size,
        x: ((Window.width / 2) - (@restart_button_size / 2)),
        y: ((Window.height / 2) - (@restart_button_size / 2))
    )

    @restart_game = true    

    @heart1.remove
    @sprite.remove
    @mol.remove
    @start.remove
    @text.remove
    @balls.each do |red_balls|
        red_balls.angry_balls.remove
    end

end