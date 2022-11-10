class Student
  attr_reader :student_id, :first_names, :last_name, :course_id
  def initialize(student_id, first_names, last_name, course_id)
    @student_id = student_id
    @first_names = first_names
    @last_name = last_name
    @course_id = course_id
  end
end