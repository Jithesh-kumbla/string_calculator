# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..]) # can use delete_prefix or many more..
      numbers = parts[1]
    end

    delimiter_escaped_numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = delimiter_escaped_numbers.select(&:negative?)

    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    delimiter_escaped_numbers.sum
  end
end
