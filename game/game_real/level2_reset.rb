#om man är död och gamestatus/level är 2 och klickar på en restart knapp eller klickar på c körs denna funktionen
#det som händer är att allt ska startas om från den leveln
def when_update_level_2
    variabel_when_update_level_2
    remove_when_update_level_2
    position_when_update_level_2
    add_when_update_level_2
    balls_when_update_level_2

    score_text_reset#funktion i score_text.rb
    
end

#några varaibler ställs om
def variabel_when_update_level_2

    @score = 0
    @liv = 3
    @restart_game = false

end

#restart_button tas bort
def remove_when_update_level_2

    @restart_button.remove

end

#några grejer får en ny position
def position_when_update_level_2
    
    @mol.x = Window.width - @square_size
    @mol.y = Window.height - @square_size
    @start.x = 0
    @start.y = 0
    @sprite.x = ((@square_size - @sprite_storlek) / 2)
    @sprite.y = ((@square_size - @sprite_storlek) / 2)

end

#några grejer läggs till på skärmen
def add_when_update_level_2
    @sprite.add
    @mol.add
    @start.add
    @heart1.add
    @heart2.add
    @heart3.add

end

#bollarna läggs till. 
#kör en funktion i balls.rb
def balls_when_update_level_2

    balls

end
