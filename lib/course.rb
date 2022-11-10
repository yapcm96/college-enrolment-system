class Course
  attr_reader :count, :identifier, :name
  def initialize(name=nil, identifier=nil)
    @count = 0
    @identifier = name
    @name = identifier
  end

  def add_count
    @count += 1
  end
end
