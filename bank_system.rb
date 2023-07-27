require_relative 'bank_account'

class BankSystem
  attr_reader :accounts

  def initialize
    @accounts = []

    # Create default accounts
    create_account("Naruto Uzumaki", "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6")
    create_account("Itachi Uchiha", "Doctor", "itachi.uchiha@yahoo.com", "Gh. Baritiu Street No 7")
  end
  
  @@daily_withdrawal_total = 0

  def self.daily_withdrawal_total
    @@daily_withdrawal_total
  end

  def self.daily_withdrawal_total=(amount)
    @@daily_withdrawal_total = amount
  end

  def create_account(name, job, email, address)
    account = BankAccount.new(name, job, email, address)
    @accounts << account
    puts "Successfully created account!"
    account
  end

  def display_accounts
    @accounts.each_with_index do |account, index|
      puts "Account number #{index + 1}:"
      account.display_account_info
      puts "   ---   "
    end
  end

  def find_account_by_name(name)
    @accounts.find { |account| account.name == name }
  end
end
