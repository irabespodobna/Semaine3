def won?
		win_combo = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
	           		  [0, 3, 6], [1, 4, 7], [2, 5, 8],
	          		  [0, 4, 8], [2, 4, 6]  ]

	  victory = 0

	 	win_combo.each do |combo|
	 		puts "#{@cases[combo[0]]}"
	 	end
end

won?