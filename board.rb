



## This is can be added to so that one can play with a board that is dynamic. However it is currently set to nil
def reponse_to_dynamic_board(start_pos, board_size_x, board_size_y) 
    return nil
end



# function that takes in an array start_pos = [pos_x, pos_y, orientation] returns an end position array after one step.
# function purposely coded so that start_pos can be any positional array, so one could add other entities on to the board 
# and still have this function be viable for them.

def new_board_position(start_pos, board_size_x, board_size_y)

    orientation_array = ['N', 'E', 'S', 'W']
    orientation_num = start_pos[2]


    if start_pos.kind_of?(Array)

        if start_pos.length == 3 

            if (start_pos[0].is_a? Integer) && (start_pos[1].is_a? Integer) && (start_pos[2].is_a? Integer)

                if (start_pos[0] > 0 && start_pos[0] < board_size_x - 1) && (start_pos[1] > 0 && start_pos[1] < board_size_y - 1) && (start_pos[2] >= 0 && start_pos[2] < 4)
                    a = start_pos[0] + ((-1)**(orientation_num/2))*((orientation_num)%2)
                    b = start_pos[1] + ((-1)**(orientation_num/2))*((orientation_num+1)%2)
                    return [a, b]

                elsif (start_pos[0] < 0 && start_pos[0] >= board_size_x) && (start_pos[1] < 0 && start_pos[1] >= board_size_y)
                    return reponse_to_dynamic_board(start_pos, board_size_x, board_size_y)
                end

            end

        end

    end

    return nil

end

