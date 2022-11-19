require 'string_repeater'

RSpec.describe StringRepeater do
  it "should repeat a string two times" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string.").ordered
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("2")
    expect(terminal).to receive(:puts).with("Here is your result:")
    expect(terminal).to receive(:puts).with("TWIXTWIX")
    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end

  it "should repeat a string five times" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string.").ordered
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("5")
    expect(terminal).to receive(:puts).with("Here is your result:")
    expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIX")
    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end

  it "should fail if user put string in times" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string.").ordered
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("hi")
    string_repeater = StringRepeater.new(terminal)
    expect { string_repeater.run }.to raise_error "Please enter a number!"
  end
end