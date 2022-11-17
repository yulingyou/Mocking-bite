require "track"

RSpec.describe Track do
  context "#matches?" do
    it "matches title" do
      track = Track.new("my_title", "my_artist")
      expect(track.matches?("my_title")).to eq true
    end

    it "matches artist" do
      track = Track.new("my_title", "my_artist")
      expect(track.matches?("my_artist")).to eq true
    end

    it "Doesn't match the track" do
      track = Track.new("my_title", "my_artist")
      expect(track.matches?("don't match")).to eq false
    end
  end
end