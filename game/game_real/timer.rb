def time 

    if @game_status < 4 && @info_status != true
        if Time.now.to_i % 2 == 0 && @tid_udda_eller_even == false

            @tid_screen = Time.now.to_i - @time
            @tid_udda_eller_even = true
            @text_tid.remove

            @text_tid = Text.new(
                "#{@tid_screen}",
                x: (Window.width / 2) - 20,
                y: 25,
                font: @font,
                size: 40,
                color: @text_color,
                z:100
            )
        elsif Time.now.to_i % 2 != 0 && @tid_udda_eller_even == true

            @text_tid.remove
            @tid_screen = Time.now.to_i - @time
            @tid_udda_eller_even = false

            @text_tid = Text.new(
                "#{@tid_screen}",
                x: (Window.width / 2) - 20,
                y: 25,
                font: @font,
                size: 40,
                color: @text_color,
                z:100

            )

        end
    end

end

def tid_reset

    @time = Time.now.to_i
    @tid_screen = 0
    @text_tid.remove
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - 20,
        y: 25,
        font: @font,
        size: 40,
        color: @text_color,
        z:100

    )

end
