# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    return numbers.to_i if numbers.match(/^\d+$/)

    numbers.split(',').map(&:to_i).sum
  end
end
