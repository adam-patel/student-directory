def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the cohort of the students"
  # get the cohort
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "enter another name"
    name = gets.chomp
    # get another cohort
    puts "and their cohort"
    cohort = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
    count = 0
    students.each do |student|
    puts count + 1
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    count = count + 1
  end
  end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)
