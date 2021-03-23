# Our code only works with the student name and cohort. 
# Add more information: hobbies, country of birth, height, etc.
def input_students
    puts "Please enter the name, country of birth, height and hobby of each student"
    puts "To finish, just hit return four times"
    # create an empty array
    students = []
    # get the first name
    puts "Enter name: "
    name = gets.chomp
    puts "Enter country of birth: "
    country_of_birth = gets.chomp
    puts "Enter student height: "
    height = gets.chomp
    puts "Enter their hobby: "
    hobby = gets.chomp
    # while the inputs are not empty, repeat this code
    while !name.empty? && !country_of_birth.empty? && !height.empty? && !hobby.empty? do
      # add the student hash to the array
      students << {name: name, cohort: :november, country_of_birth: country_of_birth, height: height, hobby: hobby}
      puts "Now we have #{students.count} students"
      # get another set of info from the user
      puts "Enter name: "
      name = gets.chomp
      puts "Enter country of birth: "
      country_of_birth = gets.chomp
      puts "Enter student height: "
      height = gets.chomp
      puts "Enter their hobby: "
      hobby = gets.chomp
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
      puts "#{student[:name]} (#{student[:cohort]} cohort): #{student[:country_of_birth]}, #{student[:height]} and #{student[:hobby]}"
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