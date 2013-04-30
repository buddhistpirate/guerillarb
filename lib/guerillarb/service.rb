module Guerillarb
	module Service

		def self.service_request(library, number_of_lines)
			lines = library.retrieve_lines(number_of_lines)
			MultiJson.dump(lines)
		end

		def self.close_socket(socket)

			socket.close unless socket.closed?
			puts "Closing connection #{socket}"
		end

		def self.handle_connection(library, socket)
			while line = socket.readline
				if line.match(/^exit$/)
					close_socket socket
					break
				else
					number_of_lines = line.to_i	
					json = service_request(library, number_of_lines)
					socket.puts(json + "\n")
				end

			end
		rescue EOFError
			close_socket(socket)
		end

		def self.listen(library, hostname, port)
			server = TCPServer.new(hostname,port)
			child_monitor_threads = []
			loop do
				connection = server.accept
				puts "Connection accepted at #{connection}"
				pid = fork do
					handle_connection(library,connection)
					Kernel.exit!
				end
				child_monitor_threads << Process.detach(pid)
			end
		ensure 
			puts "Waiting on all forked children"
			child_monitor_threads.each do |thread|
				thread.join if thread
			end
		end

	end
end
