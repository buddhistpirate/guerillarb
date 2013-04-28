module Guerillarb
	class Guerilla
		FIXTURES = "#{__dir__}/../../spec/fixtures"
		DEFAULT_HOSTNAME = 'localhost'
		DEFAULT_PORT = 8080

		attr_reader :directory, :hostname, :port, :library


		def initialize(options = {})
			@directory = options[:directory] || FIXTURES
			@hostname = options[:hostname] || DEFAULT_HOSTNAME
			@port = options[:port] || DEFAULT_PORT
		end

		def handle_signal
			puts "Shutting down server on #{hostname}:#{port}"
			Kernel.exit(0)
		end

		def register_traps
			["TERM","INT"].each do |sig|
				Signal.trap(sig) do
					handle_signal
				end
			end
		end

		def load_library
			@library = Guerillarb::Library.new
			library.add_directory(directory)
			puts "Library has #{library.size} files"
		end

		def listen
			puts "Listening on #{hostname}:#{port}"
			Guerillarb::Service.listen(library, hostname , port) 
		end
	end
end
