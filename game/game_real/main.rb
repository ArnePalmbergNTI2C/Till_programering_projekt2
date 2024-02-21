#kommentera koden
#lämna in github länken
#filma
#dokumentation

#gör så att ruby2d fungerar inom ruby
require 'ruby2d'

#hittar filer som går att använda till koden
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

#klassen game. allting som inte är de röda bollarna skapas och sker här
class Game
    attr_reader :sprite, :restart_button_0, :restart_button, :restart_game, :game_status, :sprite_storlek, :info_status, :info_button, :x_info_button #gör så att dessa variablerna är tillgänliga utanför klassen game
     
    #när klassen game skapas ska detta ske. här startar en funktion i filen start_up.rb
    def initialize
        start_up
    end

    #denna funktion uppdateras hela tiden från update do loopen.
    def update_hela_tiden
        when_hit_red_ball #kallar på en funktion i filen hit_red_ball.rb
        when_hitt_mol #kallar på en funktion i filen mol.rb
        when_hit_block #kallar på en funktion i filen block.rb
        when_max_score #kallar på en funktion i filen max_score.rb
        @balls.each { |game| game.move } #kallar på en funktion i klassen red_balls som heter move. detta skera för alla balls.
        time #kallar på en funktion i timer.rb
        antal_liv #kallar på en funktion i liv.rb

    end

    #denna funktion uppdatera när den kallas längre ner i filen. när knappen "c" klickas och man är död ska spelet starta om från senaste leveln.
    def game_reset_checkpoint 
        #en swicth case sats som kollar vad @game_status är (Alltså vilken level/nivå/sida man är på)
        case @game_status 
        when 1 #om game_status är 1 startar en funktion i level1_reset.rb
            when_update_level_1
        when 2 #om game_status är 2 startar en funktion i level2_reset.rb
            when_update_level_2
        when 3 #om game_status är 3 startar en funktion i level3_reset.rb
            when_update_level_3
        end
    end

    #denna funktion uppdatera när den kallas längre ner i filen. när knappen "backspace" klickas eller om man klickar på en restart button startar en funktion i game_reset.rb och hela spelet start om.
    def reset_whole_game 
        when_game_reset
    end

 
    #denna funktion uppdatera när den kallas längre ner i filen. när knappen "i" klickas ner startar en funktion i info.rb och en info screen visas
    def info_screen
        info
    end
    
end

#klassen red_balls. alla röda bollar skapas här
class Red_balls

    attr_reader :angry_balls #gör så att angry_balls fungerar utanför klassen red_balls

    #när denna klass kallas ska detta hända. 6 inputs tar den emot när denna kallas. x är vilket x värde bollen ska starta på. y_speed är vilken fart den ska ha i höjd. y är vilket y värde bollen ska starta på. x_speed är vilken fart den ska ha i bredd. game_status ges av @game_status(alltså vilken level det är) så man kan veta och använda variablen i denna klassen också. radius_angry_balls används för att när bollarna ska skapas ska det veta hur stora bollarna ska vara. variabeln skapas inte här för att den används i klassen game också.
    def initialize(x, y_speed, y, x_speed, game_status, radius_angry_balls)
        @y_speed = y_speed #inputen y_speed blir till @y_speed
        @x_speed = x_speed #inputen y_speed blir till @x_speed
        @game_status = game_status #inputen game_staus blir till @game_status

        #en cirkel skapas som kallas angry_balls
        @angry_balls = Circle.new( 
        x: x, # x_värde från inputen
        y: y, #y_värde från inputen
        radius: radius_angry_balls, #radius från inputen
        color: 'red', #färg
        z: 100 #vilken "höjd" objektet har
        )

    end
    
    #funktionen kallas hela tiden från funktionen update_hela_tiden i klassen game och öppnar en funktion i filen ball_movement.rb. Detta gör att bollarna flyttar på sig i sidleds och höjd
    def move 
        ball_movement
    end

end

#startar/öppnar/kallar på klassen game
game = Game.new 

#när en knapp trycks ner och hålls nere ska detta hända. här är det bara spritens rörelse med knapparna "w" "a" "s" "d"
on :key_held do |event|

    speed = 5 #speed är hur mycket spriten ska flytta på sig i x och y led. 

    #om restart_game och info_status variblerna i klassen game är false ska detta hända. om restart_game är true betyder det att att man har dött och väntar på att t.ex starta om. när info_status är true betyder det man har tagit upp informations skärmen och kan därför inte röra sig 
    if game.restart_game == false && game.info_status == false

        #en switch case sats där om event key alltså en viss tangent är nertryckts ska något hända
        case event.key
        when 'w' #om w klickas ska spriten få en animation och förflyttas uppåt om y värdet är mer än 3. detta för att inte gå utanför skärmen. 
            game.sprite.play

            if game.sprite.y > 3
                game.sprite.y -= speed
            end
        when 's' #om s klickas ska spriten få en animation och förflyttas neråt om y värdet inte är utanför skärmen 
            game.sprite.play

            if game.sprite.y < (Window.height - game.sprite.width - 3)
                game.sprite.y += speed
            end
        when 'a' #om a klickas ska spriten få en animation omvänt och förflyttas vänster om x värdet inte är utanför skärmen 
            game.sprite.play flip: :horizontal
            if game.sprite.x > 2
                game.sprite.x -= speed
            end
        when 'd' #om d klickas ska spriten få en animation och förflyttas höger om x värdet inte är utanför skärmen 
            game.sprite.play

            if game.sprite.x < (Window.width - (game.sprite_storlek + 3))
                game.sprite.x += speed
            end
        end
    
    end

end

#om en kanpp är tryckt ska detta hända
on :key_down do |event|

    #om restart_game är true alltså att man är död och väntar och om knappen c trycks in ska funktion längre upp i filen starta. 
    if game.restart_game == true

        if event.key == 'c'
            game.game_reset_checkpoint
        end

    end
    
    #en switch case sats där om event key alltså en viss tangent är nertryckts ska något hända
    case event.key
    when 'backspace' #om backspace är netryckt ska en funktion längre upp i filen starta
        game.reset_whole_game
    when 'i'
        game.info_screen #om i är netryckt ska en funktion längre upp i filen starta
    end

end

#om musen är tryckt ska detta hända
on :mouse_down do |event|
    #om en liten restart knapp är tryckt ska samma sak hända som när man klickar backspace. en funktion längre upp i filen startar
    if game.restart_button_0.contains?(event.x, event.y)
        game.reset_whole_game

    #om en liten restart knapp är tryckt ska samma sak hända som när man klickar i. en funktion längre upp i filen startar
    elsif game.info_button.contains?(event.x, event.y)
        game.info_screen

    #om en restart knapp är tryckt ska samma sak hända som när man klickar c. en funktion längre upp i filen startar. detta får dock bara hända om man är död och info skärmen inte är öppen
    elsif game.restart_game == true && game.info_status == false && game.restart_button.contains?(event.x, event.y) 
        game.game_reset_checkpoint

    #om en stäng knapp på infoskärmen är tryckt ska samma sak hända som när man klickar i. en funktion längre upp i filen startar. detta får dock bara hända när infoskärmen redan är öppen.
    elsif game.x_info_button.contains?(event.x, event.y) && game.info_status == true
        game.info_screen
    end

end

on :key_up do #när någon knapp lyfts ska spriten slutar animera en snurr.
    game.sprite.stop 
end

update do #detta uppdateras hela tiden. har game innan för att man ska gå in i klassen game
    
    game.update_hela_tiden

end

show #gör så att spelet visas på skärmen