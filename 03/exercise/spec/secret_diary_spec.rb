require 'secret_diary'

RSpec.describe SecretDiary do
context "unit testing peer classes" do
  it "should return diary at beginng" do
    fake_diary = double(:fake_diary,contents: "Happy day")
    secret_diary = SecretDiary.new(fake_diary)
    expect(secret_diary.read).to eq fake_diary
  end

    it "should return go away when the diary is locked" do
      fake_diary = double(:fake_diary, contents:"Happy day")
      secret_diary = SecretDiary.new(fake_diary)
      secret_diary.lock
      expect(secret_diary.read).to eq "Go away"
  end

  it "should return the diary when the diary is unlocked" do
    fake_diary = double(:fake_diary, contents:"Happy day")
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.lock
    secret_diary.unlock
    expect(secret_diary.read).to eq fake_diary
  end
end

end