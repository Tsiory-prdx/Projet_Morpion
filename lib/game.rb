require_relative 'player'
require_relative 'board'
require_relative 'show'



class Game

    attr_accessor :player, :board, :current_player, :status, :counter
    
    def initialize
        @player = []
        @status = "on going"
        @board = Board.new
        @counter = 0
        icone_used = ["X" , "O"]

        for i in 1..2
            puts "Entrer le nom du joueur num #{i}"
            print "ici >"
            name_of_player = gets.chomp
            
            players = Player.new(name_of_player , icone_used[i - 1])
            
            @player << players

            puts "********************************"
        end
            

            show_player
            @current_player = @player[0]
            puts "********************************"
            puts "Commencez!!!!!"
            Show.new.show_board(@board)
            
    end
    
    def show_player
        for i in 1..2
            puts "le joueur num #{i} est #{player[i - 1].name}, il a l'icone #{player[i - 1].value}"
        end
        puts "********************************"
    end
    
    def turn
        @board.play_turn(@current_player)
            
        puts "Tour ##{@counter + 1}"
            
        Show.new.show_board(@board)
            
        if @board.victory?(@current_player) && @counter < 9
              
          puts @current_player.name + " IS THE WINNEEEER!!!"
          @status = "finished"
        elsif @counter == 8
            puts "Match nul"
            @status = "finished"
        end
               
        if @current_player == @player[0]
            @current_player = @player[1]
          elsif @current_player = @player[1]
           @current_player = @player[0]
        end
            @counter += 1
    end
    
end