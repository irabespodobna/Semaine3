require 'colored2'

require_relative 'player.rb'

class Game
	attr_accessor :players, :board


  # Ici on va présenter le programme puis récupérer les noms des joueurs et leur assigner un symbole
  # Ensuite on initie la Board
	def initialize 
		puts " Welcome to the super Tic Tac Toe !"
		puts
		puts "Please enter the first player's name ""(will play as #{'X'.green.bold}) :"
		print '> '
		player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, 'X'.green.bold)
    puts '_'.yellow.bold * 55
    puts
    puts "Please enter the first player's name ""(will play as #{'O'.red.bold}) :"
    print '> '
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, 'O'.red.bold)
    @players = [player_1, player_2]
    @board = Board.new
  end


  # Ici on va faire une méthode qui va définir une partie
  def start_game
    #Il y a 9 cases donc maximum 9 tours de jeu.  
  	9.times do |turn|
  		if @board.won? == 0
        # on continue de jouer des tours tant que @board.won? == 0
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
      puts
    end
    	
  end

  # Ici on va défnir un tour de jeu
  def turns(i)
    # pour remmettre un nouveau tableau en haut du termianl
  	system('clear')
  	@board.display_board
    # 'i' ici va aller de 0 à 9 au maximum. afin de faire un tour sur deux pour chaque joueur, on met i % 2 qui nous donnera soit 0 soit 1 à chaque fois.
    # comme j'ai mis mes 2 players dans un array, lorsque je rappelle @players[a], j'obtiens player_1 ou player_2 en fonction du tour de jeu.
  	a = i % 2
  	puts "#{@players[a].name}, which slot do you want to play (between 1 and 9) ?"
    move = gets.chomp.to_i
    # ici on vérifie que le move (ou le choix) est bien compris entre 1 et 9 et que la case est bien libre
    ## là j'écris que si le move est différent de 1..9 ou que la case est prise dans ce cas là tu rentres dans les conditions des cas
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
    # ici je rappelle la méthode qui se trouve dans ma classe Board pour éxectuer le move choisi par le joueur
  	@board.play(move, @players[a].symbol)
  end

end