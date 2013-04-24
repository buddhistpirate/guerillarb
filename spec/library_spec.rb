require 'spec_helper'
module Guerillarb
	describe Library do
		it "can add file to library" do
			library = Library.new
			library.add_source_document("#{FIXTURES}/oneline.txt")
			library.size.should == 1
		end

		it "can add directory to library" do
			library = Library.new
			library.add_directory(FIXTURES)
			library.size.should == 4
		end

		it "can retrieve requested lines" do
			library = Library.new
			["oneline.txt","twolines.txt","sixlines.txt"].each do |filename|
				library.add_source_document("#{FIXTURES}/#{filename}")
			end

			library.size.should == 3

			lines_to_retrieve = 12
			lines = library.retrieve_lines(lines_to_retrieve)

			lines.size.should == lines_to_retrieve
		end
	end
end
