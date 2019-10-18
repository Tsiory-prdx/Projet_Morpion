class Show
    
    def show_board(board)
        board.board_Case_Array.each_with_index do |bcase , i|
        print "[" + bcase.value + "]"
        puts " " if (i+1) %3 == 0
        end
    end
end