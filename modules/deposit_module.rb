require_relative '../bank_account'

module Deposit

  def deposit_amount(amount)
    if valid_amount?(amount)
      puts "Are you sure do you want to deposit #{amount}$? \n Press y to continue or n to abort"
      confirmation_input = gets.chomp
      if confirmation_input == "y" 
        @balance += amount
        puts "Deposit successful. You deposited $#{amount}. Your new balance is $#{@balance}."
      end
    else
      puts "The amount of money you need to deposit must be positive."
    end
  end
end
