require_relative 'bank_account'
require_relative 'bank_system'

# Main program
bank_system = BankSystem.new

puts "Welcome! \n What do you want to do?"

loop do
  puts "\n Press: \n 1 - create account; \n 2 - display all the accounts; \n 3 - retrieve money; \n 4 - deposit money; \n 5 - display current balance; \n 6 - exit. "

  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Hi! \n Insert your name."
    name = gets.chomp
    name.downcase!
    name.capitalize!

    puts "#{name}, insert your job."
    job = gets.chomp
    job.downcase!

    puts "Insert your email."
    email = gets.chomp
    email.downcase!

    puts "Insert your address."
    address = gets.chomp
    address.downcase!

    account = bank_system.create_account(name, job, email, address)

    puts "Set a PIN for your account. \n It needs to be 4 digits long. "
    pin = gets.chomp

    while (pin.length > 4 || pin.length < 4)
      puts "The chosen PIN is not valid. \n A 4-digit PIN is needed. "
      pin = gets.chomp
    end

    account.set_pin(pin)
  when 2
    bank_system.display_accounts
  when 3
    puts "\n Insert your name. "
    name = gets.chomp
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account not found. Please create an account first."
    else
      puts "#{name}, enter your PIN: "
      insert_pin = gets.chomp
      if insert_pin == account.pin
        puts "Insert sum in $ to retrieve, but no more than 5000$ "
        amount = gets.chomp.to_f
        if amount <= 0
          puts "Invalid amount. Please enter a positive value."
        else
          account.withdraw_amount(amount)
        end
      else
        puts "Incorrect PIN. Withdrawal failed."
      end
    end
  when 4
    puts "\n Insert your name. "
    name = gets.chomp
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account with name #{name} not found. \n Please create an account."
    else
      puts "#{name}, enter your PIN: "
      insert_pin = gets.chomp
      if insert_pin == account.pin
        puts "Insert sum in $ to deposit"
        amount = gets.chomp.to_f
        if amount <= 0
          puts "Please enter a positive amount of money to deposit."
        else
          account.deposit_amount(amount)
        end
      else
        puts "Incorrect PIN. Deposit failed."
      end
    end
when 5
    puts "Insert your name."
    name = gets.chomp
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account with name #{name} not found. \n Please create an account."
    else
      print "Insert PIN: "
      insert_pin = gets.chomp
      if insert_pin == account.pin
        account.display_balance
      else
        puts "Incorrect PIN. Access denied."
      end
    end
  when 6
    puts "See you later!"
    break
  end
  puts "\n"
end
