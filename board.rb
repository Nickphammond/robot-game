# function that takes in an array start_pos = [pos_x, pos_y, orientation] returns an end position array after one step.
# function purposely coded so that start_pos can be any positional array, so one could add other entities on to the board 
# and still have this function be viable for them.
def new_board_position(start_pos)

    orientation_array = ['N', 'E', 'S', 'W']
    board_size_x = 5
    board_size_y = 5
    orientation_num = null
    i = 0
    while (i < 4) && (orientation_num != 0)
        
        if orientation_array[i] == user_o
            orientation_num = i
        end

        i = i + 1
    end

    if orientation_num != null


        a = start_pos[0] + (-1**(orientation_num/2))*((orientation_num)%2)
        b = start_pos[1] + (-1**(orientation_num/2))*((orientation_num+1)%2)
        if (a >= 0 && a <= board_size_x) && (b >= 0 && b <= board_size_y)
            return [a, b]
        end


    end

    puts 'An invalid move was passed to the new_board_position function'
    return null



end