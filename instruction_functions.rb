
require_relative "input_class.rb"






# This method is for submitting an input for the initial place location and a format array which informs how the input should
# handled, providing an appropriate input object has been defined for the application.

def place_input(inp, format_arr)


   

    state = true
    answer_array = []

    sub_length = 0
    segment_length = 0
    m = 0
    while state && m < format_arr.length


        # Here we list through the array to detect segments of instructions from the input
        val = nil
        callback = nil
        i = 0
        j = 1
        if format_arr[m][1] != '' 
            while (inp[sub_length + i] != format_arr[m][1]) && (sub_length + i < inp.length - 1)
                i = i + 1
            end
            while (inp[sub_length + i + j] == ' ') && (sub_length + i + j < inp.length - 1)
                j = j + 1
            end
        else
            i = inp.length - sub_length
        end

        # Test to see if format is violated
        if !((inp[sub_length + i] == format_arr[m][1]) || format_arr[m][1] == '')
            state = false
        end


        # InputObject is where the methods for processing all the different type of format combinations. A new InputObject is
        # created and the relevant arguments are passed. If the developer has not supplied InputObject code, then rather than
        # causing an error, it will give a warning.
        begin
            input_object = InputObject.new(inp, sub_length, i, format_arr[m][0])
            callback = input_object.process_input().push(j - 1)


            if callback != nil

                state = callback[0]
                segment_length = callback[1]
                answer_array.push(callback[2])
                sub_length = sub_length + segment_length + format_arr[m][1].length

                m = m + 1
    
            end

        rescue
            callback = nil
            puts "Unable to continue as input class has not been defined for place_input method"
        end

    end


    if state

        if !(sub_length == inp.length)
            state = false
        end

    end

    if state
        return answer_array
    end

    return nil

end






def move_one_position(start_pos, board_size_x, board_size_y)

    orientation_array = ['N', 'E', 'S', 'W']
    


    if start_pos.kind_of?(Array) && (board_size_x.is_a? Integer) && (board_size_y.is_a? Integer)

        if start_pos.length == 3 && (board_size_x > 0) && (board_size_y > 0)

            a = 0
            b = 0
            if (start_pos[0].is_a? Integer) && (start_pos[1].is_a? Integer) && (start_pos[2].is_a? Integer)

                if (start_pos[0] >= 0 && start_pos[0] <= board_size_x - 1) && (start_pos[1] >= 0 && start_pos[1] <= board_size_y - 1) && (start_pos[2] >= 0 && start_pos[2] < 4)

                    a = start_pos[0]
                    b = start_pos[1]

                    if (start_pos[0] > 0 && start_pos[0] < board_size_x - 1) && (start_pos[1] > 0 && start_pos[1] < board_size_y - 1) 
                        orientation_num = start_pos[2]
                        a = a + ((-1)**(orientation_num/2))*((orientation_num)%2)
                        b = b + ((-1)**(orientation_num/2))*((orientation_num+1)%2)
                        return [a, b]

                    else
                        return [a, b]
                    end

                elsif (start_pos[2] >= 0 && start_pos[2] < 4)
                    return reponse_to_dynamic_board(start_pos, board_size_x, board_size_y)
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

        if pos_arr.length == 3 

            if (pos_arr[0].is_a? Integer) && (pos_arr[1].is_a? Integer) && (pos_arr[2].is_a? Integer)

                if (pos_arr[2] >=0 && pos_arr[2] < 4)

                    return pos_arr[0].to_s + ',' + pos_arr[1].to_s + ',' + orientation_array[pos_arr[2]].to_s

                end

            end
        
        end

    end
    
    return nil

end