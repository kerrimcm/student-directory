# Once you complete the previous exercise, change the way the users are displayed: 
# print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts 
# (the map() method may be useful but it's not the only option), 
# iterate over it and only print the students from that cohort.
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
    students.group_by(&:cohort).each do |student|
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