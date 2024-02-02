#fixa koden snyggt
#gubben i väggen

require 'ruby2d'
require_relative 'start_up.rb'
require_relative 'mol.rb'
require_relative 'hit_red_ball.rb'
require_relative 'block.rb'
require_relative 'ending.rb'
require_relative 'level1_reset.rb'
require_relative 'level2_reset.rb'
require_relative 'level3_reset.rb'
require_relative 'ball_movement.rb'
require_relative 'game_reset.rb'

set background: 'navy'
set title: 'filer/Biggie cheese.io'
set width: 1100
set height: 700
SONG = Music.new('filer/biggie_cheese.mp3') 
SONG2 = Music.new('filer/vinst.mp3') 
HIT = Sound.new('filer/hit.mp3') 
SUCCESS = Sound.new('filer/success.mp3') 
SMALL_SUCCESS = Sound.new('filer/small_success.mp3')
SCARY = Sound.new('filer/scary.mp3') 

class Game  
    attr_reader :sprite, :restart_button_0, :restart_button_1, :restart_button_2, :restart_button_3, :restart_game, :game_status, :sprite_storlek
    
    def initialize
        start_up
    end

    def hitt_mol
        when_hit_mol
    end

    def hitt_red_ball
        when_hit_red_ball
    end

    def hit_block
        when_hit_block
    end

    def ending
        when_ending
    end

    def update
        @balls.each { |game| game.move }
    end

    def update_game_start
        when_update_level_1
    end

    def update_game_checkpoint
        when_update_level_2
    end

    def update_game_last_level
        when_update_level_3
    end

    def reset_hole_game
        game_reset
    end
    
end

class Red_balls

    attr_reader :angry_balls, :balls

    def initialize(bredd, upp_ner, start, sida, game_status, radius)
        @y_speed = upp_ner
        @x_speed = sida
        @game_status = game_status
        @radius_angry_balls = 
        @angry_balls = Circle.new(
        x: bredd,
        y: start,
        radius: radius,
        color: 'red',
        z: 100)   
    end

    def move
        ball_movement
    end

end

game = Game.new

on :key_held do |event|
    speed = 5
    if game.restart_game == false

    case event.key
        when 'w'
            if game.sprite.y > -2
                game.sprite.y -= speed
                game.sprite.play
            else
                game.sprite.play
            end
        when 's'
            if game.sprite.y < (Window.height - game.sprite.width + 2)
                game.sprite.y += speed
                game.sprite.play
            else
                game.sprite.play
            end
        when 'a'
            if game.sprite.x > 2
                game.sprite.play flip: :horizontal
                game.sprite.x -= speed
            else
                game.sprite.play
            end
        when 'd'
            game.sprite.play
            if game.sprite.x < (Window.width - (game.sprite_storlek + 5))
                game.sprite.x += speed
            end
        when 'backspace'
            game.reset_hole_game
        end

    end
end


on :mouse_down do |event|
    if game.restart_button_0.contains?(event.x, event.y)
        game.reset_hole_game
    end

    if game.restart_game == true
        if game.restart_button_1.contains?(event.x, event.y)
           game.update_game_start
        elsif game.restart_button_2.contains?(event.x, event.y)
            game.update_game_checkpoint
        elsif game.restart_button_3.contains?(event.x, event.y)
            game.update_game_last_level
        end
    end
end

on :key_up do
    game.sprite.stop
end

update do
    
    game.update
    game.hitt_mol
    game.hitt_red_ball
    game.ending
    game.hit_block

end

show