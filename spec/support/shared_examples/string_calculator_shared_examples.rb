# frozen_string_literal: true

RSpec.shared_examples 'string calculator' do |input, expected_output|
  it "should return #{expected_output} for the provided #{input}" do
    expect(subject.add(input)).to eq(expected_output)
  end
end

RSpec.shared_examples 'negative number handler' do 
  it "should raise exception when trying to add negative numbers" do
    expect { subject.add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed: -2")
  end
end
