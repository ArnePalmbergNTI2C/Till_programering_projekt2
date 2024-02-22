#funktion time körs hela tiden från update do loopen
#funktion gör att tiden på skärmen ökar med 1 varje sekund
#om man inte är på sista sidan och inte har öppnat info bilden ska saker hända

#om tiden just nu i integer är ett jämnt tal ska tiden skrivas ut
#sen när tiden just nu i integer är udda ska tiden skrivas igen
#detta gör att tiden ökar med 1 varje sekund
#för att förhindra att skriva ut flera tid texter varje sekund så finns varaiblen tid_udda_eller_even. 
#denna variabeln byter från true till false för att förhindra att texten skrivs ut flera gånger
def time

    if @game_status < 4 && @info_status != true
        if Time.now.to_i % 2 == 0 && @tid_udda_eller_even == false

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

#funktion som startar om tiden på skärmen
#t.ex när man reset hela banan ska tiden också börja om.
#när tid texten är på skärmen tar time funktionen över igen
def tid_reset 
    @time = Time.now.to_i
    @tid_screen = 0
    @text_tid.remove
    @text_tid = Text.new(
        "#{@tid_screen}",
        x: (Window.width / 2) - (@text_size / 2),
        y: @text_tid_y,
        font: @font,
        size: @text_tid_size,
        color: @text_color,
        z:100
    )

end