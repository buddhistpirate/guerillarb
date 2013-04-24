module Guerillarb
	class Library
		extend Forwardable
		
		attr_reader :documents
		def_delegators :documents, :size

		def initialize
			@documents = []
		end

		def add_source_document(file_name)
			source = SourceDocument.new(file_name)
			source.read_file
			documents << source
		end

		def add_directory(directory)
			Dir.glob("#{directory}/**/*").each do |file|
				add_source_document(file) unless File.directory?(file)
			end
		end

		def retrieve_lines(number_of_lines)
			source = documents.sample
			lines = source.retrieve_lines(number_of_lines)
			lines_remaining = number_of_lines - lines.size
			(lines += retrieve_lines(lines_remaining)) if lines_remaining > 0
			lines
		end
	end
end

