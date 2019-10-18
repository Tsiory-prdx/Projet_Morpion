require_relative 'boardcase'
require_relative 'show'

class Board

    attr_accessor :board_Case_Array

    def initialize 
        @board_Case_Array = []     
        
        all_case = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
       
        all_case.each do |case_s_piece|
            @board_Case_Array << BoardCase.new(case_s_piece , " ")
        end
    end

    def play_turn(player)

        puts "C'est ton tour " + player.name + "!!!!!!!!"
        print ">"
        choice = gets.chomp

        @board_Case_Array.each do |case_s_piece|
            if case_s_piece.index == choice && case_s_piece.value == " "
                case_s_piece.value = player.value
            end
        end
    end


    def victory?(player)
    
        winner = [
          
          @board_Case_Array[0].value == player.value && @board_Case_Array[1].value == player.value && @board_Case_Array[2].value == player.value,
          @board_Case_Array[3].value == player.value && @board_Case_Array[4].value == player.value && @board_Case_Array[5].value == player.value,
          @board_Case_Array[6].value == player.value && @board_Case_Array[7].value == player.value && @board_Case_Array[8].value == player.value,
          
          @board_Case_Array[0].value == player.value && @board_Case_Array[3].value == player.value && @board_Case_Array[6].value == player.value,
          @board_Case_Array[1].value == player.value && @board_Case_Array[4].value == player.value && @board_Case_Array[7].value == player.value,
          @board_Case_Array[2].value == player.value && @board_Case_Array[5].value == player.value && @board_Case_Array[8].value == player.value,
          
          @board_Case_Array[0].value == player.value && @board_Case_Array[4].value == player.value && @board_Case_Array[8].value == player.value,
          @board_Case_Array[2].value == player.value && @board_Case_Array[4].value == player.value && @board_Case_Array[6].value == player.value
        ]
        
        
        winner.each do |win|
          if win
            return true
          end
        end
        
        
        return false
      end

end
