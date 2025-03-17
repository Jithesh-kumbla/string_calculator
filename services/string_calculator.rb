# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.to_i if numbers.match(/^\d+$/)
  end
end
