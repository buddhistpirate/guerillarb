require 'spec_helper'
module Guerillarb
	describe SourceDocument do
		it "should read lines into array" do
			source = SourceDocument.new("#{FIXTURES}/oneline.txt")
			source.read_file
			source.size.should == 1
			source.lines.first.should == "first line\n"
		end

		it "should return number of lines" do
			source = SourceDocument.new("#{FIXTURES}/twolines.txt")
			source.read_file
			source.size.should == 2	
		end

		it "should retrieve one line" do
			source = SourceDocument.new("#{FIXTURES}/oneline.txt")
			source.read_file
			number_of_lines_requested = 2
			lines = source.retrieve_lines(number_of_lines_requested)
			lines.size.should == 1
		end

		it "should retrieve multiple lines" do
			source = SourceDocument.new("#{FIXTURES}/sixlines.txt")
			source.read_file
			Random.stub!(:rand).and_return(4)
			number_of_lines_requested = 5
			lines = source.retrieve_lines(number_of_lines_requested)
			lines.size.should == 2
		end

	end
end
