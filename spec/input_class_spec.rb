describe 'InputObject' do

    it '' do
        inp = 'PLACE'
        start = 0
        i = 5
        input_type = 'STRING'

        obj = InputObject.new(inp, start, i, input_type)
        expect(obj.process_input).to eq [true, i]
    end

    it '' do
        inp = 'PLCE'
        start = 0
        i = 5
        input_type = 'STRING'

        obj = InputObject.new(inp, start, i, input_type)
        expect(obj.process_input).to eq [false, i]
    end

end