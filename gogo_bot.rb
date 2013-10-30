require "socket"

class GoGoBot
	
	def initialize(server = nil)
		@nick = "GoGoBot"
		@channel = "#bitmaker"
		@server = "chat.freenode.net"
		@port = "6667"
	end

	def run
		@server = TCPSocket.open(@server, @port)
		@server.puts "USER bhellobot 0 * BHelloBot"
		@server.puts "NICK #{@nick}"
		@server.puts "JOIN #{@channel}"
		@server.puts "PRIVMSG #{@channel} : Magic 8 balls have nothing on me! Ask me a question"

		
		until @server.eof? do
	     respond @server.gets
	   
    end
	end

	def respond(message)
		answer = ["Maybe", "Ask again later", "Maybe not", "I'm a robot! how am I supposed to know"]
		if message.include? "?"
			answer.sample
			@server.puts "PRIVMSG #{@channel} : #{answer.sample}"

		else
			puts " I need a question with a question mark to predict the future people"

		end
		
	end

end
gogobot = GoGoBot.new
gogobot.run
gogobot.respond


