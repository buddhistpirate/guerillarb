module Guerillarb
	module Service

		def self.service_request(library, number_of_lines)
			lines = library.retrieve_lines(number_of_lines)
			MultiJson.dump(lines)
		end

		def self.handle_connection(library, socket)
			number_of_lines = socket.readline.to_i
			json = service_request(library, number_of_lines)
			socket.puts(json + "\n")
		end

		def self.listen(library, hostname, port)
			server = TCPServer.new(hostname,port)
			loop do
				Thread.start(server.accept) do |socket|
					handle_connection(library,socket)
				end
			end
		end

	end
end
