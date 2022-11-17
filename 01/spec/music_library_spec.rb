require "music_library"

RSpec.describe MusicLibrary do
  context "initialize library" do
    it "should return empty array when it's initialized" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
  end

  context "add two tracks to the library" do
    it "return both tracks" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track)
      track_2 = double(:fake_track)
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1,track_2]
    end
  end

  context "search track in library" do
    it "search matches the title" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: true)
      track_2 = double(:fake_track, matches?: false)
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("title_1")).to eq [track_1]
    end

    it "search matches the artist" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: true)
      track_2 = double(:fake_track, matches?: false)
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("artist_1")).to eq [track_1]
    end

    it "if search doesn't matches anything return empty list" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: false)
      track_2 = double(:fake_track, matches?: false)
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("song")).to eq [ ]
    end

    it "if should return both tracks" do
      music_library = MusicLibrary.new
      track_1 = double(:fake_track, matches?: true)
      track_2 = double(:fake_track, matches?: true)
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("the")).to eq [track_1,track_2]
    end
  end
end