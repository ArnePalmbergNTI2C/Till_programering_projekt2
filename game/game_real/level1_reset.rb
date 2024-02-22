#om man är död och gamestatus/level är 1 och klickar på en restart knapp eller klickar på c körs denna funktionen
#det som händer är att allt ska startas om från den leveln

def when_update_level_1
    variabel_when_update_level_1
    remove_when_update_level_1
    position_when_update_level_1
    add_when_update_level_1
    balls_when_update_level_1

    score_text_reset #funktion i filen score_text.rb

end

#några varaibler ställs om
def variabel_when_update_level_1

    @score = 0
    @liv = 3
    @restart_game = false

end

#restart_button tas bort
def remove_when_update_level_1

    @restart_button.remove

end

#några grejer får en ny position
def position_when_update_level_1

    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @mol.x = Window.width - @square_size
    @mol.y = ((Window.height / 2 ) - @square_size / 2 )
    @start.x = 0
    @start.y = ((Window.height / 2 ) - @square_size / 2 )
end

#några grejer läggs till på skärmen
def add_when_update_level_1
    @sprite.add
    @mol.add
    @start.add
    @heart1.add
    @heart2.add
    @heart3.add
    
end

#bollarna läggs till. 
#kör en funktion i balls.rb
def balls_when_update_level_1
  
    balls

end