require 'diary'

RSpec.describe Diary do
  it "should return Happy day" do
    diary = Diary.new("Happy day")
    expect(diary.read).to eq "Happy day"
  end
end