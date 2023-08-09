require_relative 'bank_account'

class BankSystem
  attr_reader :accounts

  def initialize
    @accounts = []
  end
  
  def create_account(user)
    account = BankAccount.new(user)
    @accounts << account
    # puts "Successfully created account!"
    account
  end

  def display_accounts
    @accounts.each_with_index do |account, index|
      puts "Account number #{index + 1}:"
      account.display_account_info
      puts "-----"
    end
  end

  def find_account_by_name(name)
    @accounts.find { |account| account.user.name == name }
  end
end
