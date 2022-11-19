require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
  it "subtracts two numbers using the terminal" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("3").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("4 - 3 = 1")
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run
  end

  it "fail if user didn't enter number at the first time" do 
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("hi").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    expect { interactive_calculator.run }.to raise_error "You must enter a number"
  end

  it "fail if user didn't enter number at the second time" do 
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("hii").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    expect { interactive_calculator.run }.to raise_error "You must enter a number"
  end
end