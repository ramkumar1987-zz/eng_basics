# An API to calculate the Fibonacci sequence.
class Fibs
  # Array containing values in the fibonacci sequence.
  attr_accessor :generated_fibs

  # Generates the fibonacci sequence for the given value.
  #
  # no_of_fibonacci_numbers - Number of fibonacci numbers
  # to generate. Should be greater than zero.
  #
  # Returns the fibonacci sequence for the given value.
  def generate(no_of_fibonacci_numbers)
    unless generated_fibs.nil?
      if no_of_fibonacci_numbers <= @generated_fibs.size
        return @generated_fibs[0..no_of_fibonacci_numbers - 1]
      end
    end

    return [0] if no_of_fibonacci_numbers == 1
    return [0, 1] if no_of_fibonacci_numbers == 2

    generate_fibs no_of_fibonacci_numbers
  end

  # Checks to see if the given value is part of the fibonacci sequence.
  #
  # num - Value to be checked if it is part of fibonacci sequence.
  # Should be greater than zero.
  #
  # Returns true if the given value is part of the fibonacci sequence.
  # Returns false if the given value is not a part of the fibonacci sequence.
  def is_known_fib?(num)
    return true if @generated_fibs.include?(num)
    false
  end

  # Checks to see if the given array is the same as the fibonacci sequence.
  #
  # seq_array - array to be checked.
  #
  # Returns true if the given array is the same as the fibonacci sequence.
  # Returns false if the given value is not the same as the fibonacci sequence.
  def all_fibs?(seq_array)
    return true if seq_array == @generated_fibs
    false
  end

  # Returns the sum of squares of the numbers in the fibonacci sequence.
  def known_fibs_sum_of_squares
    return 0 if generated_fibs.nil?

    sum_of_squares = 0
    generated_fibs.each do |x|
      sum_of_squares += x * x
    end

    sum_of_squares
  end

  private

  def generate_fibs(no_of_fibonacci_numbers)
    if !@generated_fibs.nil?
      no_of_fibonacci_numbers -= @generated_fibs.size
      @generated_fibs = fibonator(no_of_fibonacci_numbers,
                                  @generated_fibs[-1], @generated_fibs[-2])
    else
      @generated_fibs = [0, 1]
      fibonator(no_of_fibonacci_numbers -= 2, 1, 0)
    end
  end

  def fibonator(no_of_fibonacci_numbers, previous1, previous2)
    no_of_fibonacci_numbers.times do
      next_val = previous1 + previous2

      @generated_fibs << next_val

      previous2 = previous1
      previous1 = next_val
    end

    @generated_fibs
  end
end
