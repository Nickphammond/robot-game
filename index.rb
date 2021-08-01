require_relative "board.rb"
require_relative "instruction_functions.rb"


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
    b = place_input(a)
    if b != nil
        user_x = b[0]
        user_y = b[1]
        user_o = b[2]
        continue = true
    elsif a == 'q'
        quit = true
    end
end


while quit == false
    a = gets.chomp
    b = check_move_input(a)
    if b == true

        new_positions = new_board_position([user_x, user_y, user_o], board_size_x, board_size_y)

        ## if statement should be overkill, as user_x, user_y, and user_o should always be valid if application otherwise sound
        if new_positions != nil
            user_x = new_positions[0]
            user_y = new_positions[1]
        end

    else
        ## else statement and then an if statement rather than just an elsif statement so that change_orientation function
        # only needs to be called once

        new_orientation = change_orientation(a, user_o)
        if new_orientation != nil

            user_o = new_orientation

        else
            
            if a == "REPORT"

                report = report_position([user_x, user_y, user_o])
                puts report

            elsif a == 'q'

                quit = true

            else
                puts "INVALID INPUT"
            end
        end

    end
end

