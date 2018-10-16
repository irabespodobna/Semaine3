require 'pry'

## 	Ceci est la classe des joueurs
class Player
 	attr_accessor :name ,:symbol

 	def initialize(name, symbol)
 		@name = name.capitalize
 		@symbol = symbol
 	end

 	def to_s
 		return "#{@name}, plays as #{@symbol}"
 	end

end