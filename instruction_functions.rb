
require_relative "input_class.rb"






# This method is for submitting an input for the initial place location and a format array which informs how the input should
# handled, providing an appropriate input object has been defined for the application.

def place_input(inp, format_arr)

    state = true
    answer_array = []

    sub_length = 0
    segment_length = 0
    m = 0
    count = 0
    while state && m < format_arr.length

        count = count + 1

        # Here we list through the array to detect segments of instructions from the input
        val = nil
        callback = nil
        i = 0
        j = 1
        k = 0

        while (inp[sub_length + i] != ' ' && inp[sub_length + i] != format_arr[m][1]) && (sub_length + i < inp.length - 1)
            i = i + 1
        end

        if format_arr[m][1] != ' ' && inp[sub_length + i] == ' '
            while (inp[sub_length + i + k] != format_arr[m][1]) && (sub_length + i + k < inp.length - 1)
                k = k + 1
            end
        end

        while (inp[sub_length + i + j + k] == ' ') && (sub_length + i + j + k < inp.length - 1)
            j = j + 1
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
            callback = input_object.process_input()
            state = callback[0]
            segment_length = callback[1]
            answer_array.push(callback[2])
            sub_length = sub_length + segment_length + format_arr[m][1].length + (j - 1) + k
            m = m + 1

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




# method for moving the position of the robot on the board, taking in an array start_pos denoting the starting position and 
# orientation: start_pos = [X, Y, O]
# Also takes board_size_x and board_size_y for the dimensions of the x and y coordinate respectively.

def move_one_position(start_pos, board_size_x, board_size_y)

    orientation_array = ['N', 'E', 'S', 'W']
    
    begin
        a = 0
        b = 0
        if (start_pos[0].is_a? Integer) && (start_pos[1].is_a? Integer) && (start_pos[2].is_a? Integer)

            orientation_num = start_pos[2]
            a = start_pos[0] + ((-1)**(orientation_num/2))*((orientation_num)%2)
            b = start_pos[1] + ((-1)**(orientation_num/2))*((orientation_num+1)%2)

            dir_a = a - start_pos[0]
            dir_b = b - start_pos[1]

            step_a = (a/board_size_x)
            step_b = (b/board_size_y)

            if step_a != 0
                step_a = 1
            end
            if step_b != 0
                step_b = 1
            end

            a = a - step_a*dir_a
            b = b - step_b*dir_b

            return [a, b]

        end

    rescue

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


# Given an array of the form [X, Y, O], where all elements are integers, and O in particular is an integer between 0 and 3
# where 0 corresponds to N, 1 corresponds to E, 2 corresponds to S, 3 corresponds to W.
def report_position(pos_arr)

    orientation_array = ['N', 'E', 'S', 'W']

    begin

        if (pos_arr[2] >=0 && pos_arr[2] < 4) && (pos_arr[0].is_a? Integer) && (pos_arr[1].is_a? Integer)

            return pos_arr[0].to_s + ',' + pos_arr[1].to_s + ',' + orientation_array[pos_arr[2]].to_s

        end

    rescue

    end
    
    return nil

end