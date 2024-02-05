def when_ending
    if @score == @max_score1
        @game_status = 2
        @heart1.remove
        @heart2.remove
        @heart3.remove
        @heart1 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart2 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart3 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
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
        @balls.each do |red_balls|
            red_balls.angry_balls.remove
        end
          maxspeed = 20
          minstspeed = 15
          @balls = [
            Red_balls.new(10, 0, 100, rand(minstspeed..maxspeed), @game_status, 10),
            Red_balls.new(Window.width-10, 0, 150, rand(-maxspeed..-minstspeed), @game_status, 10),
            Red_balls.new(10, 0, 200, rand(minstspeed..maxspeed), @game_status, 10),
            Red_balls.new(Window.width-10, 0, 250, rand(-maxspeed..-minstspeed), @game_status, 10),
            Red_balls.new(10, 0, 300, rand(minstspeed..maxspeed), @game_status, 10),                
            Red_balls.new(Window.width-10, 0, 350, rand(-maxspeed..-minstspeed), @game_status,10),
            Red_balls.new(10, 0, 400, rand(minstspeed..maxspeed), @game_status, 10),                
            Red_balls.new(Window.width-10, 0, 450, rand(-maxspeed..-minstspeed), @game_status, 10),
            Red_balls.new(10, 0, 500, rand(minstspeed..maxspeed), @game_status, 10),                
            Red_balls.new(Window.width-10, 0, 550, rand(-maxspeed..-minstspeed), @game_status, 10),
            Red_balls.new(10, 0, 600, rand(minstspeed..maxspeed), @game_status, 10),                 
        ]
    end

    if @score2 == @max_score2
        @game_status = 3
        SUCCESS.play
        @text.remove
        @heart1.remove
        @heart2.remove
        @heart3.remove
        @heart1 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 1) - 10), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart2 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 2) - 20), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @heart3 = Image.new('filer/heart.png', x: (Window.width - (@heart_size * 3) - 30), y: 10, width: @heart_size, height: @heart_size, z: 5)
        @balls.each do |red_balls|
            red_balls.angry_balls.remove
        end
        @balls = []
        @liv = 3
        @sprite.x = ((Window.width  - @square_size) + ((@square_size - @sprite_storlek) / 2))
        @sprite.y = (Window.height  - @square_size - (@sprite_storlek / 2))
        @start.remove
        @mol.remove
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
        @rectangle1.remove
        @rectangle2.remove
        @rectangle1 = Rectangle.new(
            x: 0, y: 100,
            width: 900, height: 150,
            color: 'red',
            z: 0
        )
        @rectangle2 = Rectangle.new(
            x: Window.width - 900, y: Window.height - 250,
            width: 900, height: 150,
            color: 'red',
            z: 0
        )
        speed = 3
        @balls = [
            Red_balls.new(250, -speed, 450, 0, @game_status, 8),
            Red_balls.new(300, speed, 250, 0, @game_status, 8),
            Red_balls.new(350, -speed, 450, 0, @game_status, 8),
            Red_balls.new(400, speed, 250, 0, @game_status, 8),
            Red_balls.new(450, -speed, 450, 0, @game_status, 8),
            Red_balls.new(500, speed, 250, 0, @game_status, 8),
            Red_balls.new(550, -speed, 450, 0, @game_status, 8),
            Red_balls.new(600, speed, 250, 0, @game_status, 8),
            Red_balls.new(650, -speed, 450, 0, @game_status, 8),
            Red_balls.new(700, speed, 250, 0, @game_status, 8),
            Red_balls.new(750, -speed, 450, 0, @game_status, 8),
            Red_balls.new(800, speed, 250, 0, @game_status, 8),
            Red_balls.new(850, -speed, 450, 0, @game_status, 8),
        ]
    end

end