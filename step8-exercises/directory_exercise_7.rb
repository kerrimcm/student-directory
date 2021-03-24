# In the input_students method the cohort value is hard-coded. 
# How can you ask for both the name and the cohort? 
# What if one of the values is empty? Can you supply a default value? 
# The input will be given to you as a string? How will you convert it to a symbol? 
# What if the user makes a typo?
@students = []
  
def input_students
  puts "Please enter the name and cohort month of the student"
  puts "To finish, just hit return twice"

  valid_month_spelling = ["January", "February", "March", "April", "May", "June", "July", 
  "August", "September", "October", "November", "December"]
  
  while true do 
    puts "Enter name:"
    name = gets.chomp
    puts "Enter cohort month:"
    cohort = gets.chomp 
    if valid_month_spelling.include?(cohort)
      @students << {name: name, cohort: cohort.to_sym}
      puts "Now we have #{@students.count} students"
    elsif name.empty?
      break
    elsif cohort.empty?
      cohort = "default"
      @students << {name: name, cohort: cohort.to_sym}
      puts "Now we have #{@students.count} students"
    end
  end
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
  
input_students
print_header
print_student_list
print_footer