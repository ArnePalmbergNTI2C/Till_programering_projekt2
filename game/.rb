#5.2.4

def contains_string(input)

    i = 0

    while i < input.length

        if input[i].class == String
            x = 0
            while x < input[i].length
                if input[i][x] == "x"
                    return true
                end
                x += 1
            end
        end
        if input[i].class == Array
            x = 0
            while x < input[i].length
                if input[i][x].class == String
                    a = 0
                    while a < input[i][x].length
                        if input[i][x][a] == "x"
                            return true
                        end
                        a += 1
                    end

                end
                x += 1
            end
        end
        i += 1
    end
    return false

end


arr = [[1 ,2 ,3]  ,true ,[1 ,"axa" ,1] ,nil ,4]
p contains_string(arr) #= > true
