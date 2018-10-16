require_relative 'boardcase.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'

def restart_game
  puts 'Would you like to play again ? ' "( #{'y'.green.bold} / #{'n'.red.bold} )"
  print '> '
  if gets.chomp.to_s.downcase == 'y' 
    system('clear')
    Game.new.start_game
    restart_game 
  else
  	system('clear')
    exit 
  end
end


Game.new.start_game
restart_game