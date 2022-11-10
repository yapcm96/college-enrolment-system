# Simple College Enrolment System

This project simulates a simple college enrolment system which records information for new students.

## Running the project

Prerequisite:
1. Ruby 3.0 and above. Installation guides for MacOS and Windows can be widely found online.

To run this project, run the following commands in the terminal:
1. `bundle install`. This will install all the gems listed in the Gemfile with the versions specified in the Gemfile.lock
2. `ruby app.rb` to run the app and see the enrolment process.

Dataset of new students containing details for enrolment is located in
`college-enrolment-system/lib/asset/new_students_dataset.csv`. Therefore, new student details can be added in here by 
following the CSV format.

## What happens when the enrolment process is run

When running enrolment process, the result of each student enrolment will be printed out on the terminal. The 
enrolment process will filter out any student details that fail the validation checks (i.e. invalid student ID format, 
course ID not in listed courses, and first names or last name containing numbers) and display the appropriate 
error for the unsuccessful enrolment.

Once the enrolment process is complete, a summary of the number of students enrolled in all courses will be displayed.

This project allows new courses to be added to the available list. This can be done by adding to the `course_mapping.json`
in the `college-enrolment-system/lib/assets/` directory.