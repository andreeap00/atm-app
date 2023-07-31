require 'date'
require_relative './modules/deposit_module'
require_relative './modules/withdraw_module'
require_relative './modules/display_module'

class BankAccount
  include Deposit
  include Withdraw
  include InfoDisplay # module with methods used to display info
  
  attr_accessor :user, :pin, :balance, :last_withdrawal_date, :remaining_daily_withdrawal_limit
  
  WITHDRAWAL_LIMIT_PER_DAY = 5000

  def initialize(user)
    @user = user
    @pin
    @balance = 0.0
    @last_withdrawal_date
    @remaining_daily_withdrawal_limit = WITHDRAWAL_LIMIT_PER_DAY
  end

  # let user set PIN
  def set_pin(pin)
    @pin = pin
  end

  # validate PIN
 def valid_pin?
    if @pin.nil?
      puts "PIN required before action."
      false
    else
      puts "Insert your PIN: "
      entered_pin = gets.chomp
      if entered_pin == @pin
        true
      else
        puts "PIN is incorrect. Action failed."
        false
      end
    end
  end

  # validate requested amount of money
  def valid_amount?(amount)
    amount.to_f >= 0
  end
end
