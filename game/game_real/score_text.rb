#funktion som tar bort en text och sätter tillbaka den. 
#detta för att score har uppdaterats
def score_text_reset

    @text.remove
    @text = Text.new(
        "#{@score}",
        x: @score_text_x,
        y: @score_text_y,
        font: @font,
        size: @text_size,
        color: @text_color,
        z: 100
    )
end