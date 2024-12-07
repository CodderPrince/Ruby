class ExpenseTracker
  def initialize
    @balance = 0
    @transactions = []
  end

  def add_income(amount)
    @balance += amount
    @transactions << "Income: $#{amount}"
  end

  def add_expense(amount)
    if amount <= @balance
      @balance -= amount
      @transactions << "Expense: $#{amount}"
    else
      puts "Insufficient balance."
    end
  end

  def view_balance
    puts "Current balance: $#{@balance}"
  end

  def view_transactions
    if @transactions.empty?
      puts "No transactions available."
    else
      @transactions.each { |transaction| puts transaction }
    end
  end
end

# Example usage:
tracker = ExpenseTracker.new

loop do
  puts "\nExpense Tracker"
  puts "1. Add Income"
  puts "2. Add Expense"
  puts "3. View Balance"
  puts "4. View Transactions"
  puts "5. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter income amount: "
    amount = gets.chomp.to_f
    tracker.add_income(amount)
    puts "Income added!"
  when 2
    print "Enter expense amount: "
    amount = gets.chomp.to_f
    tracker.add_expense(amount)
  when 3
    tracker.view_balance
  when 4
    tracker.view_transactions
  when 5
    break
  else
    puts "Invalid option, try again."
  end
end
