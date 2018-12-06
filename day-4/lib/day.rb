class Day
  attr_reader :month, :day
  attr_accessor :guard, :asleep, :awake
  def initialize(month, day)
    @month = month 
    @day = day
    @guard = nil
    @asleep = nil
    @awake = nil
  end
end
