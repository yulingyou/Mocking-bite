require 'music_library'
require 'track'

RSpec.describe "integration" do
  context "add two tracks to the library" do
    it "return both tracks" do
      music_library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("title_2", "artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1,track_2]
    end
  end

  context "search track in library" do
    it "search matches the title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("title_2", "artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("title_1")).to eq [track_1]
    end

    it "search matches the artist" do
      music_library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("title_2", "artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("artist_1")).to eq [track_1]
    end

    it "if search doesn't matches anything return empty list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("title_2", "artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("song")).to eq [ ]
    end

    it "if should return both tracks" do
      music_library = MusicLibrary.new
      track_1 = Track.new("the title", "artist_1")
      track_2 = Track.new("title_2", "the artist")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("the")).to eq [track_1,track_2]
    end
  end
end
