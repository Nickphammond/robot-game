
require_relative "instruction_functions.rb"


## So that one may easily adjust the format of the input
format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]

## So that size of board can be adjusted easily
board_size_x = 5
board_size_y = 5

# Default starting position
user_x = 0
user_y = 0
user_o = 0


# This is code block is for taking the user's initial placement of the robot. The program will loop 
# until the user enters a valid input. However the user is able to quit even at this point by pressing 'q'.
continue = false
quit = false
while continue == false && quit == false
    puts "Welcome to the table-top robot. Please enter a position in the form of 'PLACE X,Y,F', where 0<=X<" + board_size_x.to_s + ", where 0<=Y<" + board_size_y.to_s
    puts 'Press q to quit'
    a = gets


    
    if a.chomp == 'q'
        quit = true
    else 
        b = place_input(a, format_arr)
        if b == false
            quit = true
        
        elsif b != nil
            if (b[1]>=0 && b[1]<board_size_x) && (b[2]>=0 && b[2]<board_size_y)
                user_x = b[1]
                user_y = b[2]
                user_o = b[3]
                continue = true
            end
        end

    end

end



# This code block is for once the user has entered a valid starting position. The user can move the robot forward, rotate it, 
# or can call for a report giving the robot's position.

while quit == false

    a = gets.chomp

    if check_move_input(a)

        new_positions = move_one_position([user_x, user_y, user_o], board_size_x, board_size_y)
        if new_positions != nil
            user_x = new_positions[0]
            user_y = new_positions[1]
        end

    elsif a == "LEFT" || a == "RIGHT"

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




