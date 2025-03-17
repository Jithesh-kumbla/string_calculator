# frozen_string_literal: true

require 'rspec'
require_relative '../services/string_calculator'
require 'support/shared_examples/string_calculator_shared_examples'

RSpec.describe ::StringCalculator do
  subject { described_class.new }
  describe '#add' do
    include_examples 'string calculator', '', 0
    include_examples 'string calculator', '1', 1
    include_examples 'string calculator', '1,2,3', 6
    include_examples 'string calculator', '1,5', 6
    include_examples 'string calculator', "1\n2,3", 6
    include_examples 'string calculator', "//;\n1;2", 3
    include_examples 'string calculator', "2, 1001", 2
    
    # include_examples 'negative number handler'
    # it 'should return 0 when an empty string is passed' do
    #   expect(StringCalculator.new.add('')).to eq 0
    # end

    # it 'should return the number itself when a single number is provided' do
    #   expect(StringCalculator.new.add('1')).to eq 1
    # end

    # it 'should handle any amount of numbers that is passed as a string' do
    #   expect(StringCalculator.new.add("1,2,3")).to eq 6
    #   expect(StringCalculator.new.add("1,5")).to eq 6
    # end

    # it 'should allow to handle new lines between numbers' do
    #   expect(StringCalculator.new.add("1\n2,3")).to eq(6)
    # end

    # it 'should support different delimiters' do
    #   expect(StringCalculator.new.add("//;\n1;2")).to eq 3
    # end


    context 'handle negative numbers' do
      it 'will raise exception when included' do
        expect { StringCalculator.new.add('1,-2,3') }.to raise_error(RuntimeError, 'negative numbers not allowed: -2')
      end
    end

    # context 'ignore numbers > 1000' do
    #   it 'should ignore when imput is greater than 1000' do
    #     expect(StringCalculator.new.add("2, 1001")).to eq 2
    #   end
    # end

    it 'supports delimiter of any length' do
      expect(StringCalculator.new.add("//[***]\n1***2***3")).to eq 6
    end
  end
end
