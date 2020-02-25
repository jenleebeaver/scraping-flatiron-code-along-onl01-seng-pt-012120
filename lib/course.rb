
class Course
  attr_accessor :title, :schedule, :description #passing our instance methods

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
