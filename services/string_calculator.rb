# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    num_list = numbers.split(/#{delimiter}|\n/).map(&:to_i)

    negatives = num_list.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    num_list.reject { |num| num > 1000 }.sum
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2) 
      delimiters = parts[0][2..]      # Extract everything after "//"

      # Handle multiple delimiters: "//[***][%%]\n1***2%%3"
      delimiter_list = delimiters.scan(/\[([^\]]+)\]|([^,])?/).flatten.compact
      escaped_delimiters = delimiter_list.map { |d| Regexp.escape(d) }.join("|")

      return escaped_delimiters, parts[1]
    end
    [",", numbers]  # Default delimiter is ","
  end
end
