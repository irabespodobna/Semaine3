require 'colored2'
require_relative 'boardcase.rb'

class Board

	attr_accessor :cases

	
	def initialize
		@cases = []
		for i in (1..9)
			@cases << BoardCase.new(i.to_s)
		end
	end

	def display_board
		under = "_".cyan.bold
		barre = "|".cyan.on.cyan
		space = " "
		puts space * 30 + barre + space * 5 + barre
		puts space * 28 + @cases[0].value + space + barre + space*2 + @cases[1].value + space*2 + barre + space*2 + @cases[2].value
		puts space * 30 + barre + space * 5 + barre
	  puts space * 25 + under * 18
	  puts
	  puts space * 30 + barre + space * 5 + barre
	  puts space * 28 + @cases[3].value + space + barre + space*2 + @cases[4].value + space*2 + barre + space*2 + @cases[5].value
	  puts space * 30 + barre + space * 5 + barre
	  puts space * 25 + under * 18
	  puts
	  puts space * 30 + barre + space * 5 + barre
	  puts space * 28 + @cases[6].value + space + barre + space*2 + @cases[7].value + space*2 + barre + space*2 + @cases[8].value
	  puts space * 30 + barre + space * 5 + barre
	  puts 
	end
	
	def play(move, result)
    @cases[move - 1].value = result
  end

  def position_taken?(move)
    if @cases[move - 1].value == 'X'.green.bold || @cases[move - 1].value == 'O'.red.bold
      true
    else
      false
    end
  end

	def won?
		possible_combo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	  win = 0
	 	possible_combo.each do |combo|
		 	if @cases[combo[0]].value == 'X'.green.bold && @cases[combo[1]].value == 'X'.green.bold && @cases[combo[2]].value == 'X'.green.bold
		 		win = 1
		 	elsif @cases[combo[0]].value == 'O'.red.bold && @cases[combo[1]].value == 'O'.red.bold && @cases[combo[2]].value == 'O'.red.bold
		 		win = 2
		 	end
		end
		win
	end
 			
end