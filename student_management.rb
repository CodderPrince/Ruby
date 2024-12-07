class Student
  attr_accessor :name, :age, :grade

  def initialize(name, age, grade)
    @name = name
    @age = age
    @grade = grade
  end

  def to_s
    "#{@name}, Age: #{@age}, Grade: #{@grade}"
  end
end

class StudentManagementSystem
  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def view_students
    if @students.empty?
      puts "No students available."
    else
      @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student}"
      end
    end
  end

  def update_student(index, name, age, grade)
    student = @students[index]
    student.name = name
    student.age = age
    student.grade = grade
    puts "Student updated!"
  end

  def delete_student(index)
    @students.delete_at(index)
    puts "Student deleted!"
  end
end

# Example usage:
sms = StudentManagementSystem.new

loop do
  puts "\nStudent Management System"
  puts "1. Add Student"
  puts "2. View Students"
  puts "3. Update Student"
  puts "4. Delete Student"
  puts "5. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter student name: "
    name = gets.chomp
    print "Enter student age: "
    age = gets.chomp.to_i
    print "Enter student grade: "
    grade = gets.chomp
    student = Student.new(name, age, grade)
    sms.add_student(student)
    puts "Student added!"
  when 2
    sms.view_students
  when 3
    print "Enter student number to update: "
    index = gets.chomp.to_i - 1
    print "Enter new name: "
    name = gets.chomp
    print "Enter new age: "
    age = gets.chomp.to_i
    print "Enter new grade: "
    grade = gets.chomp
    sms.update_student(index, name, age, grade)
  when 4
    print "Enter student number to delete: "
    index = gets.chomp.to_i - 1
    sms.delete_student(index)
  when 5
    break
  else
    puts "Invalid option. Try again."
  end
end
