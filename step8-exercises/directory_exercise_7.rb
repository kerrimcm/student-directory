# In the input_students method the cohort value is hard-coded. 
# How can you ask for both the name and the cohort? 
# What if one of the values is empty? Can you supply a default value? 
# The input will be given to you as a string? How will you convert it to a symbol? 
# What if the user makes a typo?
def input_students
    puts "Please enter the name and cohort months of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    puts "Enter name:"
    name = gets.chomp
    puts "Enter cohort month:"
    cohort = gets.chomp  
    # while the name and month are not empty, repeat this code
    while !name.empty? && !cohort.empty? do
      # add the student hash to the array
      students << {name: name, cohort: cohort.to_sym}
      puts "Now we have #{students.count} students"
      # get another name and month from the user
      puts "Enter name:"
      name = gets.chomp
      puts "Enter cohort month:"
      cohort = gets.chomp 
      end
      # return the array of students
    students
  end
  
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print(students)
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  
  def print_footer(students)
    puts "Overall, we have #{students.count} great students"
  end
  
  students = input_students
  #nothing happens until we call the methods
  print_header
  print(students)
  print_footer(students)