class TicTacToe
	def initialize
		@win_x = false
		@win_y = false
		@array = []
		3.times {@array << ["0", "0", "0"]} 
	end

	def play
		val = true
		msg = "Player X turn: "
		user_input = ""
		while !@win_x && !@win_y && !tie && user_input != "exit"
			display
			print msg
			user_input = gets.chomp
			
			if val
				suc = update("x", user_input)
				msg = "player Y turn: " if suc
			else
				suc = update("o", user_input)
				msg = "player X turn: " if suc
			end
			val = !val if suc 
			win
		end

		display

		if @win_x
			puts "player X wins!!!"
		elsif @win_y
			puts "player O wins!!!"
		else
			puts "its a tie"
		end

	end

	private
	def display
		str = "______\n"
		if @array.length == 3
			@array.each do |ar|
				str += "|"
				ar.each do |val|
					if val == "0"
						str += " |"
					elsif val == "x"
						str += "x|"
					elsif val == "o"
						str += "o|"
					end
				end
				str += "\n______\n"
			end
		end
		puts str
	end

	private
	def update(what, where)
		arr = where.split("")
		x = arr[0].to_i - 1
		y = arr[1].to_i - 1
	
		if  x <= 2 && y <= 2 && x >= 0 && y >= 0 && @array[x][y] == "0" &&
			@array[x][y] = what 
			return true
		else
			puts "Already occupied or wrong input"
			return false
		end
	end

	private
	def win	
		if horizantal_complete("x") || vertical_complete("x") || diognal_complete("x")
			@win_x = true
		elsif horizantal_complete("o") || vertical_complete("o") || diognal_complete("o")
			@win_y = true
		end	
	end

	private
	def tie
		@array.each{|i| return false if i.include?("0") }
		return true
	end

	private
	def horizantal_complete(val)
		value = val * 3
		0.upto(2) { |i| return true if @array[i].join == value } 
		return false
	end

	private
	def vertical_complete(val)
		value = val * 3
		0.upto(2) { |i| return true if get_vertical(i) == value } 
		return false
	end

	private
	def get_vertical(col)
		str = ""
		0.upto(2) {|i| str += @array[i][col]}
		return str
	end

	private
	def diognal_complete(val)
		value = val * 3
		0.upto(1) {|i| return true if get_diognal(i) == value}
		return false
	end

	private
	def get_diognal(val)
		str = ""
		if (val == 0)
			0.upto(2) {|i| str += @array[i][i]}
		else
			str += @array[0][2] + @array[1][1] + @array[2][0]
		end
		
		return str
	end
end

t = TicTacToe.new
t.play

