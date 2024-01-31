#ny level
#reset
# förbättre koden

require 'ruby2d'

set background: 'navy'
set title: 'Biggie cheese.io'
set width: 1100
set height: 700
SONG = Music.new('biggie_cheese.mp3') 
HIT = Sound.new('hit.mp3') 
SUCCESS = Sound.new('success.mp3') 
SMALL_SUCCESS = Sound.new('small_success.mp3')
SCARY = Sound.new('scary.mp3') 

class Game  
    attr_reader :sprite, :restart_button_1, :restart_button_2, :restart_game
    
    def initialize
        SONG.loop = true
        SONG.play

        @last_level = false

        @font = 'text.ttf'
        @text_size = 40
        @score_text_x = 1058
        @score_text_y = 60
        @text_color = 'yellow'
        
        @restart_game = false

        @max_score1 = 1
        @max_score2 = 1
        @liv = 3

        @radius_angry_balls = 10

        @score = 0
        @score2 = -1

        @heart_size = 40
        @heart1 = Image.new('heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart2 = Image.new('heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart3 = Image.new('heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
        
        @restart_button_size = 100
        
        @text = Text.new(
            "#{@score}",
            x: @score_text_x,
            y: @score_text_y,
            font: @font,
            size: @text_size,
            color: @text_color,
        )
        @square_size = 50
        @start = Square.new(
            x: 0,
            y: ((Window.height / 2 ) - @square_size / 2 ),
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
        @sprite_storlek = 25
        @sprite = Sprite.new('hero.png', clip_width: 214, height: @sprite_storlek, width: @sprite_storlek, y: ((Window.height / 2 ) - @sprite_storlek / 2 ), x: ((@square_size - @sprite_storlek) / 2), z: 2)
        maxspeed = 10
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
            Red_balls.new(750, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(800, rand(minstspeed..maxspeed), 10),
            Red_balls.new(850, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(900, rand(minstspeed..maxspeed), 10),
            Red_balls.new(950, rand(-maxspeed..-minstspeed), Window.height-10),
            Red_balls.new(1000, rand(minstspeed..maxspeed), 10),

          ]
    end

    def hitt_mol

        if @mol.contains? @sprite.x + @sprite_storlek / 2 ,@sprite.y or @mol.contains? @sprite.x, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek, @sprite.y + @sprite_storlek / 2 or @mol.contains? @sprite.x + @sprite_storlek / 2, @sprite.y + @sprite_storlek
            @text.remove
            if @last_level == false
                if @score + 1 != @max_score1 or @score2 +1 != @max_score2
                    SMALL_SUCCESS.play
                end
                if @score2 >= 0
                    @score2 +=1
                    if @score2 % 2 == 0
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

                    @text = Text.new(
                        "#{@score2}",
                        x: @score_text_x,
                        y: @score_text_y,
                        font: @font,
                        size: @text_size,
                        color: @text_color,
                        )  
                else
                    @score +=1
            
                    if @score % 2 == 0
                        @start.x = 0 
                        @mol.x = Window.width - @square_size
                        
                    else
                        @start.x = Window.width - @square_size
                        @mol.x = 0
                    end
                    @text = Text.new(
                        "#{@score}",
                        x: @score_text_x,
                        y: @score_text_y,
                        size: @text_size,
                        font: @font,
                        color: @text_color,
                    )
                end
            else 
                puts "win :)"
            end
        end
    end

    def hitt_red_ball
        @balls.each do |red_ball|
            if @sprite.contains? red_ball.angry_balls.x,red_ball.angry_balls.y + @radius_angry_balls or @sprite.contains? red_ball.angry_balls.x,red_ball.angry_balls.y - @radius_angry_balls or @sprite.contains? red_ball.angry_balls.x - @radius_angry_balls,red_ball.angry_balls.y or @sprite.contains? red_ball.angry_balls.x + @radius_angry_balls,red_ball.angry_balls.y
                HIT.play
                @text.remove
                @liv -=1
                if @score2 >= 0 
                    @text = Text.new(
                        "#{@score2}",
                        x: @score_text_x,
                        y: @score_text_y,
                        size: @text_size,
                        font: @font,
                        color: @text_color,
                    )
                    
                    if @score2 % 2 == 0

                        @sprite.x = ((@square_size - @sprite_storlek) / 2)
                        @sprite.y = ((@square_size - @sprite_storlek) / 2)  
                        
                    else
                        
                        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                        @sprite.y = ((Window.height  - @square_size) + ((@square_size - @sprite_storlek) / 2))

                    end

                else
                    
                    @text = Text.new(
                    "#{@score}",
                    x: @score_text_x,
                    y: @score_text_y,
                    size: @text_size,
                    font: @font,
                    color: @text_color,
                    )

                    if @score % 2 == 0

                        @sprite.x = ((@square_size - @sprite_storlek) / 2)
                        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
                        
                    else
                        
                        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
                        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )

                    end
                end

                if @liv == 2 
                    @heart3.remove

                elsif @liv == 1
                    @heart2.remove
                elsif @liv == 0
                    @liv -= 1
                    @heart1.remove
                    @sprite.remove
                    @mol.remove
                    @start.remove
                    @text.remove
                    if @score2 >= 0
                        @restart_button_2 = Image.new('restart.png',  width: @restart_button_size, height: @restart_button_size, x: ((Window.width / 2) - (@restart_button_size / 2)), y: ((Window.height / 2) - (@restart_button_size / 2)))
                        @restart_button_1 = Image.new('restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
                        @restart_game = true
                        @balls.each do |red_balls2|
                            red_balls2.angry_balls.remove
                        end
                    else
                        @restart_game = true
                        @restart_button_2 = Image.new('restart.png',  width: @restart_button_size, height: @restart_button_size, x: -500, y: ((Window.height / 2) - (@restart_button_size / 2)))
                        @restart_button_1 = Image.new('restart.png',  width: @restart_button_size, height: @restart_button_size, x: ((Window.width / 2) - (@restart_button_size / 2)), y: ((Window.height / 2) - (@restart_button_size / 2)))
                        @balls.each do |red_balls|
                            red_balls.angry_balls.remove
                        end
                    end
                    @balls = []
                end
            end
        end
    end

    def ending
        if @score == @max_score1
            @heart1.remove
            @heart2.remove
            @heart3.remove
            @heart1 = Image.new('heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @heart2 = Image.new('heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @heart3 = Image.new('heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @liv = 3
            SUCCESS.play
            @sprite.x = ((@square_size - @sprite_storlek) / 2)
            @sprite.y = ((@square_size - @sprite_storlek) / 2)
            @text.remove
            @score2 = 0
            @score +=1
            @mol.x = Window.width - @square_size
            @mol.y = Window.height - @square_size
            @start.x = 0
            @start.y = 0

            @text = Text.new(
                "#{@score2}",
                x: @score_text_x,
                y: @score_text_y,
                color: @text_color,
                size: @text_size,
                font: @font,
            )  
            @balls.each do |red_ball|
                red_ball.angry_balls.remove
            end
              maxspeed = 20
              minstspeed = 15
              @balls = [
                Red_balls2.new(100, rand(minstspeed..maxspeed), 10),
                Red_balls2.new(150, rand(-maxspeed..-minstspeed), Window.width-10),
                Red_balls2.new(200, rand(minstspeed..maxspeed), 10),
                Red_balls2.new(250, rand(-maxspeed..-minstspeed), Window.width-10),
                Red_balls2.new(300, rand(minstspeed..maxspeed), 10),
                Red_balls2.new(350, rand(-maxspeed..-minstspeed), Window.width-10),
                Red_balls2.new(400, rand(minstspeed..maxspeed), 10),
                Red_balls2.new(450, rand(-maxspeed..-minstspeed), Window.width-10),
                Red_balls2.new(500, rand(minstspeed..maxspeed), 10),
                Red_balls2.new(550, rand(-maxspeed..-minstspeed), Window.width-10),
                Red_balls2.new(600, rand(minstspeed..maxspeed), 10),
            ]
        end

        if @score2 == @max_score2
            SUCCESS.play
            @text.remove
            @heart1.remove
            @heart2.remove
            @heart3.remove
            @heart1 = Image.new('heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @heart2 = Image.new('heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @heart3 = Image.new('heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
            @balls.each do |red_balls2|
                red_balls2.angry_balls.remove
            end
            @balls = []
            @liv = 3
            @mol.remove
            @start.remove
            @mol = Rectangle.new(
                x: 0, y: 0,
                width: @square_size, height: (@square_size * 2),
                color: 'green',
                z: 0
              )
            @start = Rectangle.new(
                x: (Window.width - @square_size), y: Window.height - (@square_size * 2),
                width: @square_size, height: (@square_size * 2),
                color: 'white',
                z: 0
              )
            @score = 0
            @score2 = -1 
            @square1 = Rectangle.new(
                x: 0, y: 100,
                width: 1000, height: 100,
                color: 'red',
                z: 0
            )
            @square2 = Rectangle.new(
                x: Window.width - 900, y: Window.height - 200,
                width: 1000, height: 100,
                color: 'red',
                z: 0
            )
            @last_level = true
        end
    end

    def update
        @balls.each { |game| game.move }
    end

    def update_game_start
        @restart_button_1.remove
        @restart_button_2.remove
        @text.remove
        @score = 0
        @score2 = -1
        @liv = 3
        @sprite.add
        @sprite.y = ((Window.height / 2 ) - @sprite_storlek / 2 )
        @sprite.x = ((@square_size - @sprite_storlek) / 2)
        @mol.add
        @mol.x = Window.width - @square_size
        @mol.y = ((Window.height / 2 ) - @square_size / 2 )
        @start.add
        @start.x = 0
        @start.y = ((Window.height / 2 ) - @square_size / 2 )
        @restart_game = false
        @heart1.add
        @heart2.add
        @heart3.add
        @text = Text.new(
            "#{@score}",
            x: @score_text_x,
            y: @score_text_y,
            font: @font,
            size: @text_size,
            color: @text_color,
        )
        maxspeed = 10
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
        Red_balls.new(750, rand(-maxspeed..-minstspeed), Window.height-10),
        Red_balls.new(800, rand(minstspeed..maxspeed), 10),
        Red_balls.new(850, rand(-maxspeed..-minstspeed), Window.height-10),
        Red_balls.new(900, rand(minstspeed..maxspeed), 10),
        Red_balls.new(950, rand(-maxspeed..-minstspeed), Window.height-10),
        Red_balls.new(1000, rand(minstspeed..maxspeed), 10),

        ]
    
    end

    def update_game_checkpoint
        @text.remove
        @score2 = 0
        @liv = 3
        @sprite.add
        @sprite.x = ((@square_size - @sprite_storlek) / 2)
        @sprite.y = ((@square_size - @sprite_storlek) / 2)
        @mol.add
        @start.add
        @mol.x = Window.width - @square_size
        @mol.y = Window.height - @square_size
        @start.x = 0
        @start.y = 0
        @restart_button_1.remove
        @restart_button_2.remove
        @restart_game = false
        @heart1.add
        @heart2.add
        @heart3.add
        @text = Text.new(
            "#{@score2}",
            x: @score_text_x,
            y: @score_text_y,
            font: @font,
            size: @text_size,
            color: @text_color,
        )
        maxspeed = 20
        minstspeed = 15
        @balls = [
          Red_balls2.new(100, rand(minstspeed..maxspeed), 10),
          Red_balls2.new(150, rand(-maxspeed..-minstspeed), Window.width-10),
          Red_balls2.new(200, rand(minstspeed..maxspeed), 10),
          Red_balls2.new(250, rand(-maxspeed..-minstspeed), Window.width-10),
          Red_balls2.new(300, rand(minstspeed..maxspeed), 10),
          Red_balls2.new(350, rand(-maxspeed..-minstspeed), Window.width-10),
          Red_balls2.new(400, rand(minstspeed..maxspeed), 10),
          Red_balls2.new(450, rand(-maxspeed..-minstspeed), Window.width-10),
          Red_balls2.new(500, rand(minstspeed..maxspeed), 10),
          Red_balls2.new(550, rand(-maxspeed..-minstspeed), Window.width-10),
          Red_balls2.new(600, rand(minstspeed..maxspeed), 10),
      ]
    
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

class Red_balls2

    attr_reader :angry_balls, :balls

    def initialize(start, left_right, bredd)
        @x_speed = left_right
        @radius_angry_balls = 10
        @angry_balls = Circle.new(
        x: bredd,
        y: start,
        radius: @radius_angry_balls,
        color: 'red')
    end

    def move
        if hit
            @x_speed = -@x_speed
        end
        @angry_balls.x = (@angry_balls.x + @x_speed)

    end

    def hit 
        if @x_speed >= 0
        
            @angry_balls.x + 10 >= Window.width
        else
            @angry_balls.x - 10 <= 0
        end

    end

end

game = Game.new

on :key_held do |event|
    speed = 5
    if game.restart_game == false

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
end


on :mouse_down do |event|
    if game.restart_game == true
        if game.restart_button_1.contains?(event.x, event.y)
           game.update_game_start
        elsif game.restart_button_2.contains?(event.x, event.y)
            game.update_game_checkpoint
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

end

show