
#info screen
#fin kod

#kommentera koden
#lämna in github länken
#filma
#dokumentation

#gör så att ruby2d fungerar inom ruby
require 'ruby2d'

#hittar filer i som går att använda till koden
require_relative 'start_up.rb'
require_relative 'mol.rb'
require_relative 'hit_red_ball.rb'
require_relative 'block.rb'
require_relative 'max_score.rb'
require_relative 'level1_reset.rb'
require_relative 'level2_reset.rb'
require_relative 'level3_reset.rb'
require_relative 'ball_movement.rb'
require_relative 'game_reset.rb'
require_relative 'timer.rb'
require_relative 'liv.rb'
require_relative 'score_text.rb'
require_relative 'balls.rb'
require_relative 'info.rb'

#sätter bakgrund, title och storlek på fönstret
set background: 'navy' 
set title: 'Biggie cheese.io'
set width: 1100
set height: 700

#skapar olika musik variabler
SONG = Music.new('filer/biggie_cheese.mp3') 
SONG2 = Music.new('filer/vinst.mp3') 
HIT = Sound.new('filer/hit.mp3') 
SUCCESS = Sound.new('filer/success.mp3') 
SMALL_SUCCESS = Sound.new('filer/small_success.mp3')
SCARY = Sound.new('filer/scary.mp3') 

class Game #klassen game. allting som inte är de röda bollarna skapas här
    attr_reader :sprite, :restart_button_0, :restart_button, :restart_game, :game_status, :sprite_storlek, :info_status, :info_button, :x_info_button #gör så att dessa variablerna är tillgänliga utanför klassen game
    
    def initialize #när klassen skapas ska detta ske
        start_up #startar en funktion i filen start_up.rb
    end

    def hitt_mol #denna funktion uppdatera hela tiden från update do loopen
        when_hitt_mol #startar en funktion i filen mol.rb
    end

    def hitt_red_ball #denna funktion uppdatera hela tiden från update do loopen
        when_hit_red_ball #startar en funktion i filen hit_red_ball.rb
    end

    def hit_block #denna funktion uppdatera hela tiden från update do loopen
        when_hit_block #startar en funktion i filen block.rb
    end

    def max_score #denna funktion uppdatera hela tiden från update do loopen
        when_max_score #startar en funktion i filen max_score.rb
    end

    def update #denna funktion uppdatera hela tiden från update do loopen
        @balls.each { |game| game.move } #startar en funktion i klassen red_balls som heter move. detta skera för alla balls.
    end

    def game_reset_checkpoint #denna funktion uppdatera när den kallas längre ner i filen. när knappen "c" klickas
        case @game_status 
        when 1 #om game_status är 1
            when_update_level_1 #startar en funktion i level1_reset.rb
        when 2 #om game_status är 2
            when_update_level_2 #startar en funktion i level2_reset.rb
        when 3 #om game_status är 3
            when_update_level_3 #startar en funktion i level3_reset.rb
        end
    end

    def reset_whole_game #denna funktion uppdatera när den kallas längre ner i filen. när knappen "backspace" klickas eller om man klickar på en restart button
        when_game_reset #startar en funktion i game_reset.rb
    end

    def timer #denna funktion uppdatera hela tiden från update do loopen
        time #startar en funktion i timer.rb
    end

    def liv #denna funktion uppdatera hela tiden från update do loopen
        antal_liv #startar en funktion i liv.rb
    end

    def info_screen #denna funktion uppdatera när den kallas längre ner i filen. när knappen "i" klickas ner
        info #startar en funktion i info.rb
    end
    
end


class Red_balls #klassen red_balls. alla röda bolalr skaps här

    attr_reader :angry_balls #gör så att angry_balls fungerar utanför klassen red_balls

    def initialize(x, y_speed, y, x_speed, game_status, radius_angry_balls) #när denna klass kallas ska detta hända. 6 inputs tar den emot när denna kallas
        @y_speed = y_speed #inputen y_speed blir till @y_speed
        @x_speed = x_speed #inputen y_speed blir till @x_speed
        @game_status = game_status #inputen game_staus blir till @game_status
        @angry_balls = Circle.new( # en cirkel skapas som kallas angry_balls
        x: x, # x_värde från inputen
        y: y, #y_värde från inputen
        radius: radius_angry_balls, #radius från inputen
        color: 'red', #färg
        z: 100 #vilken "höjd" objektet har
        )  #en cirkel skapas på skärmen
    end
    

    def move #funktionen kallas hela tiden från funktionen update i klassen game
        ball_movement # öppnar en funktion i filen ball_movement.rb
    end

end

game = Game.new #startar/öppnar/kallar på klassen game

on :key_held do |event|

    speed = 5

    if game.restart_game == false && game.info_status == false

        case event.key
        when 'w'
            game.sprite.play

            if game.sprite.y > 3
                game.sprite.y -= speed
            end
        when 's'
            game.sprite.play

            if game.sprite.y < (Window.height - game.sprite.width - 3)
                game.sprite.y += speed
            end
        when 'a'
            game.sprite.play flip: :horizontal
            if game.sprite.x > 2
                game.sprite.x -= speed
            end
        when 'd'
            game.sprite.play
            if game.sprite.x < (Window.width - (game.sprite_storlek + 3))
                game.sprite.x += speed
            end
        end
    
    end

end

on :key_down do |event|

    if game.restart_game == true

        if event.key == 'c'
            game.game_reset_checkpoint
        end

    end

    case event.key
    when 'backspace'
        game.reset_whole_game
    when 'i'
        game.info_screen
    end

end


on :mouse_down do |event|
    if game.restart_button_0.contains?(event.x, event.y)
        game.reset_whole_game
    elsif game.info_button.contains?(event.x, event.y)
        game.info_screen
    elsif game.restart_game == true && game.info_status == false && game.restart_button.contains?(event.x, event.y) 
        game.game_reset_checkpoint
    elsif game.x_info_button.contains?(event.x, event.y) && game.info_status == true
        game.info_screen
    end

end

on :key_up do #när någon knapp lyfts
    game.sprite.stop #spriten slutar animera en snurr.
end

update do #detta uppdateras hela tiden. alla har game innan för att de ska gå in i klassen game
    
    game.update
    game.hitt_mol
    game.hitt_red_ball
    game.max_score
    game.hit_block
    game.timer
    game.liv

end

show