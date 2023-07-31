require_relative 'bank_account'

class BankSystem
  attr_reader :accounts

  # array to store bank_account objects
  def initialize
    @accounts = []
  end
  
  # create and add bank_account objects
  def create_account(user)
    account = BankAccount.new(user)
    @accounts << account
    # puts "Successfully created account!"
    account
  end

  # display info regarding all accounts
  def display_accounts
    @accounts.each_with_index do |account, index|
      puts "Account number #{index + 1}:"
      account.display_account_info
      puts "-----"
    end
  end

  # find account with certain name
  def find_account_by_name(name)
    @accounts.find { |account| account.user.name == name }
  end
end
