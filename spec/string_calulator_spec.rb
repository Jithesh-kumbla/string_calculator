# frozen_string_literal: true

require 'rspec'
require_relative '../services/string_calculator'

RSpec.describe ::StringCalculator do
  describe '#add' do
    it 'should return 0 when an empty string is passed' do
      expect(StringCalculator.new.add('')).to eq 0
    end

    it 'should return the number itself when a single number is provided' do
      expect(StringCalculator.new.add('1')).to eq 1
    end

    it 'should handle any amount of numbers that is passed as a string' do
      expect(StringCalculator.new.add("1,2,3")).to eq 6
      expect(StringCalculator.new.add("1,5")).to eq 6
    end
  end
end
