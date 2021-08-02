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