class PasswordManager
  def initialize
    @passwords = {}
  end

  def add_password(website, password)
    @passwords[website] = password
    puts "Password for #{website} added."
  end

  def retrieve_password(website)
    if @passwords.key?(website)
      puts "Password for #{website}: #{@passwords[website]}"
    else
      puts "No password found for #{website}."
    end
  end
end

# Example usage:
pm = PasswordManager.new

loop do
  puts "1. Add password"
  puts "2. Retrieve password"
  puts "3. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter website name: "
    website = gets.chomp
    print "Enter password: "
    password = gets.chomp
    pm.add_password(website, password)
  when 2
    print "Enter website name: "
    website = gets.chomp
    pm.retrieve_password(website)
  when 3
    break
  else
    puts "Invalid option, try again."
  end
end
