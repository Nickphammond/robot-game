require '../instruction_functions.rb'




describe 'place_input' do


    it "enter random string" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'asdfadsfadf' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end


    it "enter string in correct format but with invalid entries" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE X,Y,F' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end

    it "enter incomplete input" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 1,1' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end

    it "enter correctly formatted input, within stated constraints of problem" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 1,1,N' + "\n"

        expect(place_input(inp, format_arr)).to eq [0, 1, 1, 0]

    end

    it "enter correctly formatted input, within stated constraints of problem" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 1,1,N' + "\n"

        expect(place_input(inp, format_arr)).to eq [0, 1, 1, 0]

    end

    it "enter correctly formatted input, within stated constraints of problem, but with too many spaces" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 1 , 1,N' + "\n"

        expect(place_input(inp, format_arr)).to eq [0, 1, 1, 0]

    end


    it "enter correctly formatted input, outside stated constraints of problem" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 10,1,W' + "\n"

        expect(place_input(inp, format_arr)).to eq [0, 10, 1, 3]

    end
    

    it "enter correctly formatted input, inside stated constraints of problem except pass invalid orientation" do

        format_arr = [['STRING', ' '], ['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE 2,4,P' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end




    it "enter differently formatted input" do

        format_arr = [['INTEGER', ','], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = '2,4,N' + "\n"

        expect(place_input(inp, format_arr)).to eq [2, 4, 0]

    end

    it "enter differently and invalidly formatted input" do

        format_arr = [['INTEGER', ''], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = '2,4,N' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end


    it "enter input that has too many spaces after commas" do

        format_arr = [['INTEGER', ''], ['INTEGER', ','], ['ORIENTATION', "\n"]]
        inp = 'PLACE  2, 4,  N' + "\n"

        expect(place_input(inp, format_arr)).to eq nil

    end


end



describe 'move_one_position' do 

    it 'pass nil as start position' do 

        start_pos = nil
        board_size_x = 5
        board_size_y = 5

        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq nil
    end


    it 'pass incomplete start position array' do 

        start_pos = [3, 3]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq nil
    end

    it 'pass valid input within constraints of problem, with all positions less than constraints' do 

        start_pos = [3, 3, 0]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [3, 4]
    end

    it 'pass valid input within constraints of problem, with all positions less than constraints' do 

        start_pos = [3, 3, 3]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [2, 3]
    end

    it 'pass valid input within constraints of problem, with all positions within constraints' do 

        start_pos = [3, 3, 0]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [3, 4]
    end

    it 'pass valid input within constraints of problem, with a postion saturating a constraint' do 

        start_pos = [3, 4, 0]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [3, 4]
    end

    it 'pass valid input within constraints of problem, with a postion saturating a constraint' do 

        start_pos = [3, 0, 2]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [3, 0]
    end

    it 'pass valid input within constraints of problem, with a postion saturating a constraint' do 

        start_pos = [0, 1, 3]
        board_size_x = 5
        board_size_y = 5
        
        expect(move_one_position(start_pos, board_size_x, board_size_y)).to eq [0, 1]
    end
    
end





describe 'check_move_input' do

    it 'check if passing "MOVE" will give false' do
        inp = 'MOVE'
        expect(check_move_input(inp)).to eq true
    end

end





describe 'change_orientation' do

    it 'check incorrectly ordered arguments' do
        inp = 1
        orientation = 'LEFT'

        expect(change_orientation(inp, orientation)).to eq nil
    end

    it 'check valid arguments' do
        inp = 'LEFT'
        orientation = 1

        expect(change_orientation(inp, orientation)).to eq 0
    end

    it 'check valid arguments' do
        inp = 'RIGHT'
        orientation = 1

        expect(change_orientation(inp, orientation)).to eq 2
    end

    it 'check valid arguments' do
        inp = 'RIGHT'
        orientation = 3

        expect(change_orientation(inp, orientation)).to eq 0
    end

end


describe 'report_position' do

    it 'check valid input' do
        pos_arr = [0, 0, 0]
        expect(report_position(pos_arr)).to eq '0,0,N'
    end

    it 'check input with invalid orientation' do
        pos_arr = [0, 0, 4]
        expect(report_position(pos_arr)).to eq nil
    end

end
