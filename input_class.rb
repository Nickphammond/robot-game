
# This class is where one can define the format of the input.

class InputObject 

    def initialize(inp, start, i, input_type)
        @inp = inp
        @start = start
        @increment = i
        @input_type = input_type
    end


    # This method is where one can define the different responses for different input types.
    def process_input()

        if (@input_type == 'STRING')

            if (@inp[@start, @increment] == 'PLACE')
                return [true, @increment, 0, 0]
            else
                return [false, @increment, 0, 0]
            end

        elsif (@input_type == 'INTEGER')

            if ((@inp[@start, @increment].to_i).to_s == @inp[@start, @increment])
                return [true, @increment, @inp[@start, @increment].to_i, 0]
            else
                return [false, @increment, @inp[@start, @increment].to_i, 0]
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
                    return [true, @increment, orientation_num, 0]
                end
            end
            return [false, 0, 0, 0]
        end

        return nil
    end

end