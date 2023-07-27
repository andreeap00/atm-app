require 'date'

class BankAccount
  attr_accessor :name, :job, :email, :address, :pin, :balance, :last_withdrawal_date, :remaining_daily_withdrawal_limit
  
  WITHDRAWAL_LIMIT_PER_DAY = 5000

  def initialize(name, job, email, address)
    @name = name
    @job = job
    @email = email
    @address = address
    @pin = nil
    @balance = 0.0
    @last_withdrawal_date = nil
    @remaining_daily_withdrawal_limit = WITHDRAWAL_LIMIT_PER_DAY
  end

  def set_pin(pin)
    @pin = pin
  end

  def deposit_amount(amount)
    if @pin.nil?
      puts "PIN is required before insertin deposit."
    else
      puts "Insert your PIN."
      insert_pin = gets.chomp
      if insert_pin == @pin
        puts "Are you sure do you want to deposit #{amount}$? \n Press y to continue or n to abort"
        yes = gets.chomp
        if yes == "y" 
          @balance += amount
          puts "Deposit successful. You deposited $#{amount}. Your new balance is $#{@balance}."
        end
      else
        puts "Incorrect PIN. Deposit failed."
      end
    end
  end

  def withdraw_amount(amount)
    if @pin.nil?
      puts "You need to set a PIN before withdrawals."
    else
      puts "Insert your PIN: "
      insert_pin = gets.chomp
      if insert_pin == @pin
        puts "Are you sure do you want to withdraw #{amount}$? \n Press y to continue or n to abort"
        yes = gets.chomp
        if yes == "y" 
          current_date = Date.today
          if @last_withdrawal_date.nil? || @last_withdrawal_date < current_date
            @remaining_daily_withdrawal_limit = WITHDRAWAL_LIMIT_PER_DAY
          end
          if amount <= @remaining_daily_withdrawal_limit && amount > 0  
            if amount <= @balance
              @balance -= amount
              @remaining_daily_withdrawal_limit -= amount
              @last_withdrawal_date = current_date
              puts "Withdrawal successful. You withdrew #{amount}$. The current balance is #{@balance}$."
            else
              puts "Insufficient funds. Your account balance is #{@balance}$."
            end
          elsif amount <= 0
            puts "Invalid amount. Please enter a positive value."
          else
            puts "Today, the maximum amount you can withdraw is #{@remaining_daily_withdrawal_limit}$."
          end
        end
      else
        puts "Incorrect PIN. Withdrawal failed."
      end
    end
  end

  def display_balance
    puts "Your current balance is #{@balance}$"
    puts "Daily withdrawal limit rest: $#{@remaining_daily_withdrawal_limit}"
  end

  def display_account_info
    puts "Account Information:"
    puts "Name: #{@name}"
    puts "Job: #{@job}"
    puts "Email: #{@email}"
    puts "Address: #{@address}"
    puts "Balance: #{@balance}$"
    puts "Daily withdrawal limit rest: #{@remaining_daily_withdrawal_limit}$"
    puts "PIN: #{'****' if @pin}"
  end
end
