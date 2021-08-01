


def place_input(inp)

    orientation_array = ['N', 'E', 'S', 'W']
    if inp[0, 6] == 'PLACE '
        puts "A"
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
                    orientation_num = nil
                    k = 0
                    while (k < 4) && (orientation_num == nil)
                        
                        if orientation_array[k] == inp[8 + i + j]
                            orientation_num = k
                        end

                        k = k + 1
                    end

                    if orientation_num != nil
                        return [inp[6, i].to_i, inp[7 + i, j].to_i, orientation_num]
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

    orientation_array = ['N', 'E', 'S', 'W']

    if pos_arr.kind_of?(Array)
        puts "ZOB"
        puts pos_arr
        if pos_arr.length == 3 

            if (pos_arr[0].is_a? Integer) && (pos_arr[1].is_a? Integer) && (pos_arr[2].is_a? Integer)

                return pos_arr[0].to_s + ',' + pos_arr[1].to_s + ',' + orientation_array[pos_arr[2]].to_s

            end
        
        end

    end
    
    return nil

end