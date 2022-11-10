require_relative 'validator.rb'
require_relative 'validation_error.rb'
require_relative 'course.rb'
require_relative 'course_collection.rb'

class Register
  def initialize
    @current_students = []
  end

  def enrol(student)
    begin
      Validator.check_missing_fields(student)
      Validator.validate_student_id(student.student_id)
      Validator.validate_course_id(student.course_id)
      Validator.validate_first_names(student.first_names)
      Validator.validate_last_name(student.last_name)

      @current_students << student
      puts "Student ID '#{student.student_id}' has been successfully enrolled"

    rescue ValidationError => e
      # Student with invalid student details who cannot be enrolled is displayed and program continues
      puts "Student ID '#{student.student_id}' failed to be enrolled: #{e}"
    end
  end

  def enrol_all(students)
    students.select { |student| enrol(student) }
  end

  def generate_report
    course_collection = CourseCollection.new
    course_collection.populate_collection_from_json('./lib/assets/course_mapping.json')

    @current_students.each do |current_student|
      course_collection.course_instances.each do |course_instance|
        if current_student.course_id == course_instance.identifier
          course_instance.add_count
        end
      end
    end

    course_collection.course_instances.each do |course_instance|
      puts "Number of students enrolled in #{course_instance.name} course: #{course_instance.count}"
    end
  end
end

