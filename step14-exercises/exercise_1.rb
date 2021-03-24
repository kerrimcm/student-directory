# After we added the code to load the students from file, 
# we ended up with adding the students to @students in two places. 
# The lines in load_students() and input_students() are almost the same. 
# This violates the DRY (Don't Repeat Yourself) principle. 
# How can you extract them into a method to fix this problem?
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  cohort = "november"
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students_hash(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def students_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end 

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    students_hash(name, cohort)
  end
  file.close
end

interactive_menu