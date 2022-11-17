class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    # ...
    @diary = diary
    @lock = false
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    if @lock == false
      @diary
    else
      "Go away"
    end
    
  end

  def lock
    # Locks the diary
    # Returns nothing
    @lock = true
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
    @lock = false
  end
end