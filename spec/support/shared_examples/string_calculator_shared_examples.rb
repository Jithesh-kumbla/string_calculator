# frozen_string_literal: true

RSpec.shared_examples 'string calculator' do |input, expected_output|
  it "should return #{expected_output} for the provided #{input}" do
    expect(subject.add(input)).to eq(expected_output)
  end
end
