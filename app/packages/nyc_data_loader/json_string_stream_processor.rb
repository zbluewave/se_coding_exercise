module NycDataLoader
class JsonStringStreamProcessor
	def initialize
		@counter = 0
		@buffer = ""
	end

	def add_char(char)
		case char
		when '{'
			@counter = @counter + 1
			@buffer << char
		when '}'
			@counter = @counter - 1
			@buffer << char
		else
			@buffer << char if @counter>0
		end
		
		if @counter == 0 && @buffer.length > 0
			yield(JSON.parse(@buffer))
			@buffer = ''
		end
	end
end
end