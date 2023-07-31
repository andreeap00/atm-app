require_relative 'user'
require_relative 'bank_account'
require_relative 'bank_system'

# Main program
bank_system = BankSystem.new

# Create default accounts
user1 = User.new("Naruto", "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6")
bank_account1 = bank_system.create_account(user1)
bank_account1.set_pin("0000")

user2 = User.new("Itachi Uchiha", "Doctor", "itachi.uchiha@yahoo.com", "Gh. Baritiu Street No 7")
bank_account2 = bank_system.create_account(user2)
bank_account2.set_pin("1111")

# Methods that ensure interaction with the user
def create_account_interaction(bank_system)
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

    user = User.new(name, job, email, address)
    account = bank_system.create_account(user)
    puts "Set a PIN for your account. \n It needs to be 4 digits long. "
    pin = gets.chomp

    while (pin.length > 4 || pin.length < 4)
      puts "The chosen PIN is not valid. \n A 4-digit PIN is needed. "
      pin = gets.chomp
    end

    account.set_pin(pin)
end

def withdraw_amount_interaction(bank_system)
  puts "\n Insert your name. "
    name = gets.chomp
    name.downcase!
    name.capitalize!
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account not found. Please create an account first."
    elsif account.valid_pin?
      puts "Insert sum in $ to retrieve, but no more than 5000$ "
      amount = gets.chomp.to_f
      if account.valid_amount?(amount)
        account.withdraw_amount(amount)
      else
      puts "Not enough funds."
      end
    else 
      puts "Incorrect PIN. Withdrawal failed."
  end
end

def deposit_amount_interaction(bank_system)
  puts "\n Insert your name. "
    name = gets.chomp
    name.downcase!
    name.capitalize!
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account with name #{name} not found. \n Please create an account."
    elsif account.valid_pin?
      puts "#{name}, insert sum in $ you to deposit"
      amount = gets.chomp.to_f
      account.deposit_amount(amount)
    else
      puts "Incorrect PIN. Deposit failed."
    end
end

def display_balance_interaction(bank_system)
  puts "Insert your name."
    name = gets.chomp
    name.downcase!
    name.capitalize!
    account = bank_system.find_account_by_name(name)
    if account.nil?
      puts "Account with name #{name} not found. \n Please create an account."
    elsif account.valid_pin?
      account.display_balance
    else
      puts "Incorrect PIN. Access denied."
    end
end

puts "Welcome! \n What do you want to do?"

loop do
  puts "\n Press: \n 1 - create account; \n 2 - display all the accounts; \n 3 - retrieve money; \n 4 - deposit money; \n 5 - display current balance; \n 6 - exit. "

  choice = gets.chomp.to_i

  case choice
  when 1
    create_account_interaction(bank_system)
  when 2
    bank_system.display_accounts
  when 3
    withdraw_amount_interaction(bank_system)
  when 4
    deposit_amount_interaction(bank_system)
  when 5
    display_balance_interaction(bank_system)
  when 6
    puts "See you later!"
    break
  end
  puts "\n"
end
