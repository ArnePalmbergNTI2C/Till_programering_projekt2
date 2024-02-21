def time #en funktion som gör att tiden på skärmen ökar med 1 varje sekund

    if @game_status < 4 && @info_status != true #om man inte är på sista sidan och inte info bilden är öppen ska detta hända
        if Time.now.to_i % 2 == 0 && @tid_udda_eller_even == false #denna if och elsif satesen gör att tiden endsat uppdateras varje sekund. om tiden just nu i integer är jämnt delbart på 2 ocn varaibeln tid_udda_eller_even är false ska detta hända

            @tid_screen = Time.now.to_i - @time #tiden på skärmen blir tiden just nu - tiden då tiden på skärmen vara 0
            @tid_udda_eller_even = true #variabeln byter till true för att förhindra att if/elsifsatsen ska köras flera gånger
            @text_tid.remove #förra tid tixen tas bort

            @text_tid = Text.new(
                "#{@tid_screen}",
                x: (Window.width / 2) - (@text_size / 2),
                y: @text_tid_y,
                font: @font,
                size: @text_tid_size,
                color: @text_color,
                z:100
            ) #ny tids text skrivs ut

        elsif Time.now.to_i % 2 != 0 && @tid_udda_eller_even == true # om tiden just nu i integer inte är jämnt delbart på 2 ocn varaibeln tid_udda_eller_even är true ska detta hända

            @text_tid.remove #förra tid tixen tas bort
            @tid_screen = Time.now.to_i - @time #tiden på skärmen blir tiden just nu - tiden då tiden på skärmen vara 0
            @tid_udda_eller_even = false #variabeln byter till false för att förhindra att if/elsifsatsen ska köras flera gånger

            @text_tid = Text.new(
                "#{@tid_screen}",
                x: (Window.width / 2) - (@text_size / 2),
                y: @text_tid_y,
                font: @font,
                size: @text_tid_size,
                color: @text_color,
                z:100
            ) #ny tids text skrivs ut

        end
    end

end

def tid_reset #funktion som startar om tiden på skärmen

    @time = Time.now.to_i #time blir till tiden just nu i integer
    @tid_screen = 0 #tiden på skärmen blir 0
    @text_tid.remove #tar bort den gamla texten
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - (@text_size / 2),
        y: @text_tid_y,
        font: @font,
        size: @text_tid_size,
        color: @text_color,
        z:100
    ) #gör en ny text

end