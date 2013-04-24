require 'spec_helper'

module Guerillarb
	describe Service do
		let(:library){ lib = Library.new; lib.add_directory(FIXTURES); lib}
		it "can service a request" do
			json = Service.service_request(library, 4)
			document = MultiJson.load(json)
			document.size.should == 4
		end
		describe :handle_connection do
			it "can handle a connection" do
				socket = double(TCPSocket)
				socket.should_receive(:readline).and_return("2\n")
				
				socket.should_receive(:puts) do |arg|
					documents = MultiJson.load(arg)
					documents.size == 2
				end

				Service.handle_connection(library, socket)
			end
		end

		describe :listen do
			it "can accept requests through tcp" do
				
				hostname = "localhost"
				port = 8080
				thread = Thread.new do
					Service.listen(library,hostname, port)
				end


				number_of_tries = 0
				begin
					raise if number_of_tries > 5
					connection = TCPSocket.new(hostname,port)
				rescue Errno::ECONNREFUSED => e 
					number_of_tries += 1
					puts "\nTrying to connect to server #{number_of_tries} tries already"
					sleep 1 
					retry
				end

				connection.puts 2
				json = connection.readline
				thread.exit
				documents = MultiJson.load(json)
				documents.size.should == 2
			end
		end


	end
end


