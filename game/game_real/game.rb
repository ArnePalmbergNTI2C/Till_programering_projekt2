
#info screen
#buggar/fel/dålig/fel kod??

#kommentera koden
#lämna in github länken
#filma
#dokumentation

require 'ruby2d'

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
    attr_reader :sprite, :restart_button_0, :restart_button, :restart_game, :game_status, :sprite_storlek, :info_status
    
    def initialize
        start_up
    end

    def hitt_mol
        when_hitt_mol
    end

    def hitt_red_ball
        when_hit_red_ball
    end

    def hit_block
        when_hit_block
    end

    def max_score
        when_max_score
    end

    def update
        @balls.each { |game| game.move }
    end

    def game_reset_checkpoint
        case @game_status
        when 1
            when_update_level_1
        when 2
            when_update_level_2
        when 3
            when_update_level_3
        end
    end

    def reset_whole_game
        when_game_reset
    end

    def timer
        time
    end

    def liv
        antal_liv
    end

    def info_screen
        info
    end
    
end


class Red_balls

    attr_reader :angry_balls, :balls

    def initialize(x, y_speed, y, x_speed, game_status, radius_angry_balls)
        @y_speed = y_speed
        @x_speed = x_speed
        @game_status = game_status
        @angry_balls = Circle.new(
        x: x,
        y: y,
        radius: radius_angry_balls,
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
    end

    if game.restart_game == true && game.restart_button.contains?(event.x, event.y) 
        case game.game_status
        when 1
            game.game_reset_checkpoint
        when 2
            game.game_reset_checkpoint
        when 3
            game.game_reset_checkpoint
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
    game.max_score
    game.hit_block
    game.timer
    game.liv

end

show