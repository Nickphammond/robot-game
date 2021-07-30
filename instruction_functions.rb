def place_input(inp)

    if inp[0, 6] == 'PLACE '

        ## this loop is currently redundant, but in this form it can be readily modified to allow for boards of size 
        ## greater than 10
        i = 0
        while (inp[6 + i] != ',') && (6 + i < inp.length - 1)
            i = i + 1
        end

        if (inp[6 + i] == ',') && ((inp[6, i].to_i).to_s === inp[6, i])

            j = 0
            while (inp[7 + i + j] != ',') && (7 + i + j < inp.length - 1) 
                j = j + 1
            end

            if (inp[7 + i + j] == ',') && ((inp[7 + i, j].to_i).to_s === inp[7 + i, j])

                if 9 + i + j == inp.length

                    if (inp[8 + i + j] == 'N') || (inp[8 + i + j] == 'S') || (inp[8 + i + j] == 'E') || (inp[8 + i + j] == 'W')
                        return [inp[6, i], inp[7 + i, j], inp[inp.length - 1]]
                    end

                end

            end

        end
    end

    return nil
end




def check_move_input(inp)
    if inp == 'MOVE'
        return true
    end
    return false
end



def change_orientation(inp, orientation)
    if inp == 'LEFT'
        return (orientation - 1)%4
    elsif inp == 'RIGHT'
        return (orientation + 1)%4
    end

    return nil
end


def report_position(pos_arr)

    return pos_arr[0]+','+pos_arr[1],','+pos_arr[2]
end