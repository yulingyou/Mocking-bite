require 'task_formatter'
require 'task'

RSpec.describe TaskFormatter do
  it "should return -[ ] Walk the dog if this task not been done" do
  fake_task = double(:fake_task, title:"Walk the dog", complete?: false)
  task_formatter = TaskFormatter.new(fake_task)
  expect(task_formatter.format).to eq "-[ ] Walk the dog"
end

it "should return -[x] Walk the dog if this task has been done" do
  fake_task = double(:fake_task, title:"Walk the dog", complete?: true)
  task_formatter = TaskFormatter.new(fake_task)
  expect(task_formatter.format).to eq "-[x] Walk the dog"
end

# why still pass without require 'task'?
#   it "should return -[x] Walk the dog if this task has been done" do
#   task = Task.new("Walk the dog")
#   task.mark_complete
#   task_formatter = TaskFormatter.new(task)
#   expect(task_formatter.format).to eq "-[x] Walk the dog"
# end

end