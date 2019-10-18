require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/board'

class Application
  1
    def perform
      
      my_game = Game.new
      
      
      while my_game.status == "on going" && my_game.counter < 9
        my_game.turn
      end
      
      puts "Voulez vous rejouer (O/N)"
        print ">"
        choice = gets.chomp

        case choice
        when "O"
          Application.new.perform
        when "N"
          exit
        end

    end
  end

  Application.new.perform