class BankAccount
  def initialize(name, balance = 0)
    @name = name
    @balance = balance
  end

  def view_balance
    puts "Balance: $#{@balance}"
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Deposited $#{amount}. New balance: $#{@balance}"
    else
      puts "Deposit amount must be positive."
    end
  end

  def withdraw(amount)
    if amount <= @balance && amount > 0
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}"
    else
      puts "Insufficient funds or invalid amount."
    end
  end

  def transfer(amount, other_account)
    if amount <= @balance && amount > 0
      @balance -= amount
      other_account.deposit(amount)
      puts "Transferred $#{amount} to #{other_account.name}. New balance: $#{@balance}"
    else
      puts "Insufficient funds or invalid amount."
    end
  end

  attr_reader :name
end

# Example usage:
account1 = BankAccount.new("Alice", 1000)
account2 = BankAccount.new("Bob", 500)

account1.view_balance
account1.deposit(200)
account1.withdraw(100)
account1.transfer(300, account2)

account2.view_balance
