









def place_input(inp, format_arr)

    class InputObject 

        def initialize(inp, start, i, input_type)
            @inp = inp
            @start = start
            @increment = i
            @input_type = input_type
        end
    
    
        def process_input()
    
            if (@input_type == 'STRING')
    
                if (@inp[@start, @increment] == 'PLACE')
                    return [true, @increment]
                else
                    return [false, @increment]
                end
    
            elsif (@input_type == 'INTEGER')
    
                if ((@inp[@start, @increment].to_i).to_s == @inp[@start, @increment])
                    return [true, @increment, @inp[@start, @increment].to_i]
                else
                    return [false, @increment, @inp[@start, @increment].to_i]
                end
    
            elsif (@input_type === 'ORIENTATION')
    
                orientation_array = ['N', 'E', 'S', 'W']
                orientation_num = nil
                h = 0
                while (h < 4) && (orientation_num == nil)
                    if orientation_array[h] == @inp[@start, @increment]
                        orientation_num = h
                    end
                    h = h + 1
                end
                if @increment == 1
                    if orientation_num != nil
                        return [true, @increment, orientation_num]
                    end
                end
                return [false]
            end
    
        end
    
    end

    

    state = true
    answer_array = []

    sub_length = 0
    segment_length = 0
    m = 0
    while state && m < format_arr.length
        
        def segment_search(inp, start, segment_break_type, input_type)

            i = 0
            if segment_break_type != '' 
                while (inp[start + i] != segment_break_type) && (start + i < inp.length - 1)
                    i = i + 1
                end
            else
                i = inp.length - start
            end
        
            if (inp[start + i] == segment_break_type) || segment_break_type == ''
        
                input_object = InputObject.new(inp, start, i, input_type)
                callback = input_object.process_input()
                return callback
        
            else
                return [false, i]
            end
        
        end

        val = segment_search(inp, sub_length, format_arr[m][1], format_arr[m][0])

        state = val[0]
        if state
            segment_length = val[1]
            if format_arr[m][0] != 'STRING'
                answer_array.push(val[2])
            end
        end
        sub_length = sub_length + segment_length + format_arr[m][1].length

        m = m + 1

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

                return pos_arr[0].to_s + ',' + pos_arr[1].to_s + ',' + orientation_array[pos_arr[2]].to_s

            end
        
        end

    end
    
    return nil

end