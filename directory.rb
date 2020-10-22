def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "Enter the cohort (november by default)"
  cohort = gets.chomp.to_sym
  if cohort.empty?
    cohort = :november
  end
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, country: "GB", }
    if students.count == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{students.count} students"
  end
    # get another name from the user
    name = gets.chomp
    puts "Enter the cohort (november by default)"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = :november
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    cohorts = students.map{ |s| s[:cohort]}

    n = 0
    while n < students.count
      puts "#{students[n][:name]} (#{students[n][:cohort]})"
      n = n + 1
  #  students.each do |student|
  #  puts "#{student[:name]} (#{student[:cohort]} cohort) #{student[:country]}"
    end
end

def print_list_by_letter(students)
  puts "Names beginning with what letter?"
  letter = gets.chomp.to_s
  initial = students.select { |student| student[:name].start_with?(letter) }
  initial.each do |v|
  puts "#{v[:name]}, #{v[:cohort]}"
  end
end

def print_students_by_cohort(students)
  if students.empty?
    puts "No students to show"
  else
    cohorts = students.map do |student|
      student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort".upcase
        students.each do |student|
          puts student[:name] if student[:cohort] == cohort
        end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Show students by initial"
    puts "4. Show students by cohort"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "3"
      print_list_by_letter(students)
    when "4"
      print_students_by_cohort(students)
    when "9"
      exit
    else
      puts "I don't know what you meant. Try again."
    end
  end
end

# nothing happens until we call the methods
interactive_menu
students = input_students
print_header
print(students)
print_list_by_letter(students)
print_students_by_cohort(students)
print_footer(students)
