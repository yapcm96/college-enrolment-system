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

# class Biology < Course
#   def initialize
#     super
#     @identifier = "BIO"
#     @name = "Biology"
#   end
# end
#
# class Chemistry < Course
#   def initialize
#     super
#     @identifier = "CHE"
#     @name = "Chemistry"
#   end
# end
#
# class ComputerScience < Course
#   def initialize
#     super
#     @identifier = "CSC"
#     @name = "Computer Science"
#   end
# end
#
# class Mathematics < Course
#   def initialize
#     super
#     @identifier = "MTH"
#     @name = "Mathematics"
#   end
# end
#
# class Physics < Course
#   def initialize
#     super
#     @name = "Physics"
#     @identifier = "PHY"
#   end
# end