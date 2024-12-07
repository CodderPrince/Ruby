class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    if b != 0
      a / b.to_f
    else
      "Cannot divide by zero"
    end
  end
end

# Example usage:
calc = Calculator.new

puts "Enter first number:"
num1 = gets.chomp.to_f
puts "Enter second number:"
num2 = gets.chomp.to_f

puts "Choose an operation (+, -, *, /):"
operation = gets.chomp

result = case operation
         when "+"
           calc.add(num1, num2)
         when "-"
           calc.subtract(num1, num2)
         when "*"
           calc.multiply(num1, num2)
         when "/"
           calc.divide(num1, num2)
         else
           "Invalid operation"
         end

puts "Result: #{result}"
