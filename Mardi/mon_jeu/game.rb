require 'colored2'

require_relative 'player.rb'

class Game
	attr_accessor :players, :board

	def initialize
		puts " Welcome to the super Tic Tac Toe !"
		puts
		puts "Please enter the first player's name ""(will play as #{'X'.green.bold}) :"
		print '> '
		player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, 'X'.green.bold)
    puts '_'.yellow * 37
    puts
    puts "Please enter the first player's name ""(will play as #{'O'.red.bold}) :"
    print '> '
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, 'O'.red.bold)
    @players = [player_1, player_2]
    @board = Board.new
  end

  def start_game

  	9.times do |turn|
  		if @board.won? == 0
  			turns(turn)
			else
        if @board.won? == 1 
          puts "#{@players[0].name.bold.underlined} is the #{"Winner !".yellow.bold}"
          puts 
        else 
          puts "#{@players[1].name.bold.underlined} is the #{"Winner !".yellow.bold}"
          puts 
        end
      	break
      end
    end
    if @board.won? == 0
    	puts "It's a tie... Try again. "
    end
    	
  end

  def turns(i)
  	system('clear')
  	@board.display_board
  	a = i % 2
  	puts "#{@players[a].name}, which slot do you want to play (between 1 and 9) ?"
    move = gets.chomp.to_i
    while !move.between?(1, 9) || (@board.position_taken?(move) == true)
    	if !move.between?(1, 9)
    		puts "You must enter a number between 1 and 9 ! "
    		puts "#{@players[a].name}, which slot do you want to play ?"
        move = gets.chomp.to_i
      elsif @board.position_taken?(move) == true
      	puts 'The slot is already taken !'
        puts "#{@players[a].name}, which slot do you want to play (between 1 and 9) ?"
        move = gets.chomp.to_i
      end
  	end
  	@board.play(move, @players[a].symbol)
    @board.display_board
  end

end