module Validator
  @course_mapping = JSON.parse(File.read('./lib/assets/course_mapping.json'))
  @course_id_list = @course_mapping.keys

  def self.check_missing_fields(student)
    missing_fields = []
    missing_fields << 'student ID' if student.student_id == nil
    missing_fields << 'course ID' if student.course_id == nil
    missing_fields << 'first names' if student.first_names == nil
    missing_fields << 'last name' if student.last_name == nil
    raise ValidationError.new, "This student details has missing #{missing_fields.to_sentence}." unless missing_fields.size == 0
  end

  def self.validate_student_id(student_id)
    unless student_id.match(/^((?:(?![IO])[A-Z]){3}(?:\d){4})$/)
      raise ValidationError.new, "Student ID '#{student_id}' does not follow format of 3 uppercase letters (excluding I and O) then 4 numbers e.g. ABC1234"
    end
  end

  def self.validate_course_id(course_id)
    unless @course_id_list.include? course_id
      raise ValidationError.new, "Course ID '#{course_id}' is not part of potential course IDs"
    end
  end

  def self.validate_first_names(first_names)
    unless first_names.match(/^((?:(?!\d).)*)$/)
      raise ValidationError.new, "First name/s '#{first_names}' must not contain a number"
    end
  end

  def self.validate_last_name(last_name)
    unless last_name.match(/^((?:(?!\d).)*)$/)
      raise ValidationError.new, "Last name '#{last_name}' must not contain a number"
    end
  end
end
