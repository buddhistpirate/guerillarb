module Guerillarb
	class SourceDocument
		extend Forwardable
		
		attr_reader :lines, :file_name
		def_delegators :lines, :size

		def initialize(file_name)
			@file_name = file_name
		end

		def read_file
			@lines = File.readlines(file_name)
		end

		def retrieve_lines(number_of_lines)
			index = Random.rand(size).to_i
			max = [size, index + number_of_lines].min
			lines[index ... max]
		end
	end

end

