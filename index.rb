
require_relative "instruction_functions.rb"

## So that one may easily adjust the format of the input
format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', '']]

## So that size of board can be adjusted easily
board_size_x = 5
board_size_y = 5
user_x = 0
user_y = 0
user_o = 0

continue = false
quit = false
while continue == false && quit == false
    puts "Welcome to the table-top robot. Please enter a position in the form of 'PLACE X,Y,F'"
    a = gets.chomp
    b = place_input(a, format_arr)
    if b != nil
        if (b[0]>=0 && b[0]<board_size_x) && (b[1]>=0 && b[1]<board_size_y)
            user_x = b[0]
            user_y = b[1]
            user_o = b[2]
            continue = true
        end
    elsif a == 'q'
        quit = true
    end
end


while quit == false
    a = gets.chomp
    b = check_move_input(a)
    if b == true

        new_positions = move_one_position([user_x, user_y, user_o], board_size_x, board_size_y)

        ## if statement should be overkill, as user_x, user_y, and user_o should always be valid if application otherwise sound
        if new_positions != nil
            user_x = new_positions[0]
            user_y = new_positions[1]
        end

    else
  
        if a == "LEFT" || a == "RIGHT"

            user_o = change_orientation(a, user_o)

        elsif a == "REPORT"

            report = report_position([user_x, user_y, user_o])
            puts report

        elsif a == 'q'

            quit = true

        else

            puts "INVALID INPUT"

        end


    end
end

