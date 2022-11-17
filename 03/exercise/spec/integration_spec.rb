require 'diary'
require 'secret_diary'

RSpec.describe "integration" do 
  it "should return diary at beginng" do
    diary = Diary.new("Happy day")
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.read).to eq diary
  end

    it "should return go away when the diary is locked" do
      diary = Diary.new("Happy day")
      secret_diary = SecretDiary.new(diary)
      secret_diary.lock
      expect(secret_diary.read).to eq "Go away"
  end

  it "should return the diary when the diary is unlocked" do
    diary = Diary.new("Happy day")
    secret_diary = SecretDiary.new(diary)
    secret_diary.lock
    secret_diary.unlock
    expect(secret_diary.read).to eq diary
  end
end


