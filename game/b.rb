require 'ruby2d'

set background: 'navy'
set title: 'Glubb.io'
set width: 800
set height: 600
song = Music.new('music.mp3') 
song.play
song.loop = true
HIT = Sound.new('hit.mp3') 
SUCCESS = Sound.new('success.mp3') 
SMALL_SUCCESS = Sound.new('small_success.mp3')
SCARY = Sound.new('scary.mp3') 


class Game  
    attr_reader :sprite

    def initialize
        @radius_angry_balls = 10
        @score = 0
        @score2 = -1
        @text = Text.new(
            "#{@score}",
            x: 760, y: 20,
            style: 'bold',
            size: 20,
            color: 'blue',
        )
        @square_size = 50
        @start = Square.new(
            x: 0,
            y: ((Window.height / 2 ) - @square_size/2 ),
            size: @square_size,
            color: 'white',
            z: 0
        )
        @mol = Square.new(
            x: Window.width - @square_size,
            y: ((Window.height / 2 ) - @square_size / 2 ),
            size: @square_size,
            color: 'green',
            z: 0
        )
        @sprite_storlek = 20
        @sprite = Sprite.new('hero.png', clip_width: 214, height: @sprite_storlek, width: @sprite_storlek, y: ((Window.height / 2 ) - @sprite_storlek / 2 ), x: 15, z: 2)
        maxspeed = 8
        minstspeed = 5
        @balls = [
            Red_balls.new(100, rand(minstspeed..maxspeed), 10),
            Red_balls.new(150, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(200, rand(minstspeed..maxspeed), 10),
            Red_balls.new(250, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(300, rand(minstspeed..maxspeed), 10),
            Red_balls.new(350, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(400, rand(minstspeed..maxspeed), 10),
            Red_balls.new(450, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(500, rand(minstspeed..maxspeed), 10),
            Red_balls.new(550, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(600, rand(minstspeed..maxspeed), 10),
            Red_balls.new(650, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(700, rand(minstspeed..maxspeed), 10),
          ]
    end

    def hitting
        if @mol.contains? @sprite.x + @sprite_storlek / 2 ,@sprite.y or @mol.contains? @sprite.x, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek / 2, @sprite.y + @sprite_storlek
            @text.remove
            @score +=1
            SMALL_SUCCESS.play
            if @score2 >= 0
                @score2 +=1
                if @score2 % 2 == 0
                    @start.x = 0 
                    @start.y = 0
                    @mol.x = Window.width - 50
                    @mol.y = Window.height - 50
                    
                else
                    @start.x = Window.width - 50
                    @start.y = Window.height - 50
                    @mol.x = 0
                    @mol.y = 0
                end

                @text = Text.new(
                    "#{@score2}",
                    x: 760, y: 20,
                    style: 'bold',
                    size: 20,
                    color: 'blue',
                )  
            else
        
                if @score % 2 == 0
                    @start.x = 0 
                    @mol.x = Window.width - 50
                    
                else
                    @start.x = Window.width - 50
                    @mol.x = 0
                end
                @text = Text.new(
                    "#{@score}",
                    x: 760, y: 20,
                    style: 'bold',
                    size: 20,
                    color: 'blue',
                )
            end
            
        end
    end

        def ending
            if @score == 5
                @sprite.x = 15
                SUCCESS.play
                @sprite.y = 15
                @text.remove
                @score2 = 0
                @score +=1
                @mol.x = Window.width - @square_size
                @mol.y = Window.height - @square_size
                @start.x = 0
                @start.y = 0
                @text = Text.new(
                    "#{@score2}",
                    x: 760, y: 20,
                    style: 'bold',
                    size: 20,
                    color: 'blue',
                )  

            end

            if @score2 == 5

                Image.new('landscape_comp.jpeg', width: 800, height: 600,)
                @score2 +=1
                SCARY.play

            end

        end

        def hitt_red_ball
        @balls.each do |red_ball|
            if @sprite.contains? red_ball.angry_balls.x,red_ball.angry_balls.y + @radius_angry_balls or @sprite.contains? red_ball.angry_balls.x,red_ball.angry_balls.y - @radius_angry_balls or @sprite.contains? red_ball.angry_balls.x - @radius_angry_balls,red_ball.angry_balls.y or @sprite.contains? red_ball.angry_balls.x + @radius_angry_balls,red_ball.angry_balls.y
                HIT.play
                if @score % 2 != 0
                    @start.x = 0 
                    @mol.x = Window.width - 50  
                    @sprite.x = 15
                    @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                end
                

                if @score2 >= 0 
                    @text.remove
                    @score2 = 0
                    @text = Text.new(
                        "#{@score2}",
                        x: 760, y: 20,
                        style: 'bold',
                        size: 20,
                        color: 'blue',)
                        @start.x = 0 
                        @start.y = 0
                        @mol.x = Window.width - 50  
                        @mol.y = Window.height - 50  
                        @sprite.x = 15
                        @sprite.y = 15

                                
                else
                    @text.remove
                    @score = 0
                    @text = Text.new(
                        "#{@score}",
                        x: 760, y: 20,
                        style: 'bold',
                        size: 20,
                        color: 'blue',)
                        @start.x = 0 
                        @mol.x = (Window.width - 50)  
                        @sprite.x = 15
                        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                    
                end
            
                
            end
        end
    end

        def update
            @balls.each { |game| game.move }
        end
    
end

class Red_balls

    attr_reader :angry_balls, :balls


    def initialize(bredd, upp_ner, start)
        @y_speed = upp_ner
        @radius_angry_balls = 10
        @angry_balls = Circle.new(
        x: bredd,
        y: start,
        radius: @radius_angry_balls,
        color: 'red')
    end

    def move
        if hit
            @y_speed = -@y_speed
        end
        @angry_balls.y = (@angry_balls.y + @y_speed)

    end


    def hit 
        if @y_speed >= 0
        
            @angry_balls.y + 10 >= Window.height
        else
            @angry_balls.y - 10 <= 0
        end

    end

end

game = Game.new

on :key_held do |event|
    speed = 4
    case event.key
    when 'w'
        if game.sprite.y > 0
            game.sprite.y -= speed
            game.sprite.play
        else
            game.sprite.play
        end
    when 's'
        if game.sprite.y < (Window.height - game.sprite.width)
            game.sprite.y += speed
            game.sprite.play
        else
            game.sprite.play
        end
    when 'a'
        if game.sprite.x > 0
            game.sprite.play flip: :horizontal
            game.sprite.x -= speed
        else
            game.sprite.play
        end
    when 'd'
        if game.sprite.x < (Window.width - game.sprite.width)
            game.sprite.x += speed
            game.sprite.play
        else
            game.sprite.play
        end
    end
end

on :key_up do
    game.sprite.stop
end

update do
    
    game.update
    game.hitting
    game.ending
    game.hitt_red_ball

end

show