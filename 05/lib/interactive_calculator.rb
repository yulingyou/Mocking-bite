class InteractiveCalculator
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will subtract two numbers."
    @terminal.puts "Please enter a number"
    num_1 = get_number
    @terminal.puts "Please enter another number"
    num_2 = get_number
    @terminal.puts "Here is your result:"
    @terminal.puts format_sum(num_1,num_2)
  end


private

def get_number
  # "2" == "2" -> 2 -> "2" 
  # "hi" == "hi" -> 0 -> "0"
  response = @terminal.gets
  return response.to_i if response == response.to_i.to_s
  fail "You must enter a number"
end

def format_sum(num_1,num_2)
  result = num_1 - num_2
  return "#{num_1} - #{num_2} = #{result}"
end

end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1