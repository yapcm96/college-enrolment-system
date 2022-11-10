require 'active_support/core_ext/array'
require 'csv'
require 'json'
require 'pry'
require './lib/register'
require './lib/student'

dataset = CSV.read("./lib/assets/new_students_dataset.csv")
dataset.shift # removes headers row
@new_students = dataset.collect { |row| Student.new *row}

register = Register.new
puts "--- Begin enrolment process ---"
register.enrol_all(@new_students)
puts "--- Enrolment process complete ---"
register.generate_report
