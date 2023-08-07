require 'date'
require_relative './modules/deposit_module'
require_relative './modules/withdraw_module'
require_relative './modules/display_module'

class BankAccount
  include Deposit
  include Withdraw
  include InfoDisplay 
  
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
  return false if @pin.nil?
  puts "Insert PIN: "
  entered_pin = gets.chomp

  return false if pin.nil?
  return true if @pin == entered_pin
end

  # validate requested amount of money
  def valid_amount?(amount)
    amount.to_f >= 0
  end
end
