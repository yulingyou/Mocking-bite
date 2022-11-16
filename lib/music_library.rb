class MusicLibrary
  def initialize
    @track = []
  end

  def add(track) # track is an instance of Track
    @track << track
  end

  def all
    @track
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @track.select do |track|
      track.matches?(keyword)
    end
  end
end