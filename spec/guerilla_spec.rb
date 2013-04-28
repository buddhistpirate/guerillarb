require 'spec_helper'

module Guerillarb
	describe Guerilla do
		let(:guerilla){Guerilla.new}
		it "can load library" do
			guerilla.load_library
			guerilla.library.size.should == 4
		end

		it "can listen on server" do
			Guerillarb::Service.should_receive(:listen)
			guerilla.listen
		end
	end
end
