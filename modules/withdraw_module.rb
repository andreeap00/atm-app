require_relative '../bank_account'

module Withdraw 
  def withdraw_amount(amount)
    if valid_amount?(amount) && amount <= @remaining_daily_withdrawal_limit
      puts "Are you sure do you want to withdraw #{amount}$? \n Press y to continue or n to abort"
      confirmation_input = gets.chomp
      if confirmation_input == "y" 
        current_date = Date.today
        if amount <= @balance
          @balance -= amount
          @remaining_daily_withdrawal_limit -= amount
          @last_withdrawal_date = current_date
          puts "Successful action. \n You withdrew #{amount}$. The current balance is #{@balance}$."
        else
          puts "Not sufficient funds. Your account balance is still #{@balance}$."
        end
      else
        puts "Today, the maximum amount you can withdraw is #{@remaining_daily_withdrawal_limit}$."
      end
    end
  end
end