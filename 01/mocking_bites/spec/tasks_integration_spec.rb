# require "task_list"
# require "task"
# require 'task_formatter'

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end
  context "# formatter" do
    it "should return -[ ] Walk the dog if this task not been done" do
      task = Task.new("Walk the dog")
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "-[ ] Walk the dog"
    end
    
    it "should return -[x] Walk the dog if this task has been done" do
      task = Task.new("Walk the dog")
      task.mark_complete
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "-[x] Walk the dog"
    end
  end
end
