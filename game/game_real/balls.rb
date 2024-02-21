def balls
    case @game_status
    when 1
        horisont_balls
    when 2
        vertikal_ball
    when 3
        small_balls
    end

end

def horisont_balls

    #(x, y_speed, y, x_speed, game_status, radius_angry_balls)

    @radius_angry_balls = 10

    maxspeed = 10
    minstspeed = 5 
    @balls = [
        Red_balls.new(100, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(150, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(200, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(250, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(300, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(350, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(400, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(450, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(500, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(550, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(600, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(650, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(700, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(750, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(800, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(850, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(900, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(950, rand(-maxspeed..-minstspeed), Window.height-10, nil, @game_status, @radius_angry_balls),
        Red_balls.new(1000, rand(minstspeed..maxspeed), 10, nil, @game_status, @radius_angry_balls),
 
    ]

end

def vertikal_ball

    #(x, y_speed, y, x_speed, game_status, radius_angry_balls)

    @radius_angry_balls = 10

    maxspeed = 20
    minstspeed = 15

    @balls = [
        Red_balls.new(10, nil, 100, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),
        Red_balls.new(Window.width-10, nil, 150, rand(-maxspeed..-minstspeed), @game_status, @radius_angry_balls),
        Red_balls.new(10, nil, 200, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),
        Red_balls.new(Window.width-10, nil, 250, rand(-maxspeed..-minstspeed), @game_status, @radius_angry_balls),
        Red_balls.new(10, nil, 300, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),                
        Red_balls.new(Window.width-10, nil, 350, rand(-maxspeed..-minstspeed), @game_status, @radius_angry_balls),
        Red_balls.new(10, nil, 400, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),                
        Red_balls.new(Window.width-10, nil, 450, rand(-maxspeed..-minstspeed), @game_status, @radius_angry_balls),
        Red_balls.new(10, nil, 500, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),                
        Red_balls.new(Window.width-10, nil, 550, rand(-maxspeed..-minstspeed), @game_status, @radius_angry_balls),
        Red_balls.new(10, nil, 600, rand(minstspeed..maxspeed), @game_status, @radius_angry_balls),                 
        
    ]

end

def small_balls

    #(x, y_speed, y, x_speed, game_status, radius_angry_balls)

    @radius_angry_balls = 8

    speed = 3
    @balls = [
        Red_balls.new(250, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(300, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(350, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(400, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(450, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(500, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(550, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(600, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(650, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(700, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(750, -speed, 450, nil, @game_status, @radius_angry_balls),
        Red_balls.new(800, speed, 250, nil, @game_status, @radius_angry_balls),
        Red_balls.new(850, -speed, 450, nil, @game_status, @radius_angry_balls),
    ]

end