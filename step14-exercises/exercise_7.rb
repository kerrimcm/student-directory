# We are de-facto using CSV format to store data. 
# However, Ruby includes a library to work with the CSV files that we could use 
# instead of working directly with the files. 
# Refactor the code to use this library.

@students = [] #accessible to all methods
require 'csv'

def interactive_menu
  loop do 
    print_menu
    input_process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def input_process(selection)
  case selection
    when "1"
      puts "Input the names of the students you'd like to add to the Academy below"
      input_students
    when "2"
      puts "See the students of the Academy below"
      show_students
    when "3"
      save_students
      puts "Students saved to the file"
    when "4"
      load_students
    when "9"
        puts "Goodbye!"
      exit # this causes the program to terminate 
    else 
      puts "I don't know what you meant, try again"
  end 
end

def input_students
  puts "Hit return to go back to the menu"
  # get the first name
  name = STDIN.gets.chomp
  cohort = "november"
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students_hash(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def students_hash(name, cohort)
  @students << {name: name, cohort: cohort}
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

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  puts "What file would you like to save the student data to?"
  filename = gets.chomp
  CSV.open(filename, "w", headers: @students.first.keys) do |csv|
    @students.each do |h| 
      csv << h.values
    end
  end
end

def load_students
  # load the students from a saved file
  puts "Which file would you like to load the student data from?"
  filename = gets.chomp
  file_open(filename)
end

def try_load_students
  filename = ARGV.first # first argument from the command line 
  if filename.nil? 
    return # get out of the method if it isn't given
  else
    file_open(filename)
  end
end 

def file_open(filename) # made the open and read feature a method for the above two
  if File.exists?(filename)
      CSV.foreach(filename) do |row|
        name, cohort = row[0], row[1]
        students_hash(name, cohort)
      end 
      puts "Loaded #{@students.count} students from #{filename}"  
  else
    puts "Sorry, #{filename} doesn't exist."
    return # return to menu
  end 
end

try_load_students
interactive_menu