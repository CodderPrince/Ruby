class TodoList
  def initialize
    @tasks = load_tasks
  end

  # Load tasks from the file
  def load_tasks
    if File.exist?("tasks.txt")
      File.readlines("tasks.txt").map(&:chomp)
    else
      []
    end
  end

  # Save tasks to the file
  def save_tasks
    File.open("tasks.txt", "w") do |file|
      @tasks.each { |task| file.puts(task) }
    end
  end

  # Add a new task
  def add_task(task)
    @tasks << task
    save_tasks
  end

  # View all tasks
  def view_tasks
    if @tasks.empty?
      puts "No tasks found."
    else
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  # Delete a task
  def delete_task(task_number)
    @tasks.delete_at(task_number - 1)
    save_tasks
  end
end

# Main program loop
todo_list = TodoList.new

loop do
  puts "\nTodo List Menu"
  puts "1. Add Task"
  puts "2. View Tasks"
  puts "3. Delete Task"
  puts "4. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task description: "
    task = gets.chomp
    todo_list.add_task(task)
    puts "Task added!"
  when 2
    todo_list.view_tasks
  when 3
    print "Enter task number to delete: "
    task_number = gets.chomp.to_i
    todo_list.delete_task(task_number)
    puts "Task deleted!"
  when 4
    break
  else
    puts "Invalid option. Please try again."
  end
end
