def time

    if @game_status <= 3
        if Time.now.to_i % 2 == 0 && @tid_udda_eller_even == false

            @tid = Time.now.to_i - @time
            @tid_udda_eller_even = true
            @text2.remove

            @text2 = Text.new(
                "#{@tid}",
                x: (Window.width / 2) - 20,
                y: 25,
                font: @font,
                size: 40,
                color: @text_color,
                z:100
            )
        elsif Time.now.to_i % 2 != 0 && @tid_udda_eller_even == true

            @text2.remove
            @tid = Time.now.to_i - @time
            @tid_udda_eller_even = false
            @text2.remove

            @text2 = Text.new(
                "#{@tid}",
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