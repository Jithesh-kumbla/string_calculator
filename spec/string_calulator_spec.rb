require 'rspec'
require_relative "../services/string_calculator.rb"

RSpec.describe ::StringCalculator do
	describe "#add" do
		it "should return 0 when an empty string is passed" do
			expect(StringCalculator.new.add("")).to eq 0
		end
	end
end