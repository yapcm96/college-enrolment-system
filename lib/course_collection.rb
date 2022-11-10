require_relative 'course'

class CourseCollection
  attr_accessor :course_instances
  def initialize
    @course_instances = []
  end

  def populate_collection_from_json(file)
    course_mapping = JSON.parse(File.read(file))

    course_mapping.each do |course_name, course_id|
      course_name_no_ws = course_name.gsub(/\s+/, "")
      Object.const_set course_name_no_ws, Class.new(Course)
      klass_name = Object.const_get course_name_no_ws
      @course_instances << klass_name.new(course_name, course_id)
    end
  end
end
