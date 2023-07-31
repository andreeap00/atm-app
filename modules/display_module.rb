require_relative '../bank_account'

module InfoDisplay 

  # methods to display info regarding balance and account are managed here
  def display_balance
    puts "Your current balance is #{@balance}$"
    puts "Daily withdrawal limit rest: $#{@remaining_daily_withdrawal_limit}"
  end
    
  def display_account_info
    puts "Personal data"
    puts "Name: #{@user.name}"
    puts "Job: #{@user.job}"
    puts "Email: #{@user.email}"
    puts "Address: #{@user.address}"
    puts "Balance: #{@balance}$"
    puts "Daily withdrawal limit rest: #{@remaining_daily_withdrawal_limit}$"
    puts "PIN: #{'****' if @pin}"
  end
end
