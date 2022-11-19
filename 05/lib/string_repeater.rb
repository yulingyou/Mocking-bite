class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string."
    string = @terminal.gets
    @terminal.puts "Please enter a number of repeats"
    times = get_number
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * times}"
  end


  private

  def get_number
    response = @terminal.gets
    return response.to_i if response.to_i.to_s == response 
    fail "Please enter a number!"
  end

end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX