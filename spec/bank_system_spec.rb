require_relative '../bank_system'
require_relative '../bank_account'
require_relative '../user'

RSpec.describe BankSystem do
  let(:bank_system) { BankSystem.new }

  describe '#initialize' do
    it 'creates empty accounts array' do
      expect(bank_system.accounts).to be_empty
    end
  end

  describe '#create_account' do
    it 'creates account and adds it to accounts list' do
      user = User.new("Naruto Uzumaki", "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6")
      account = bank_system.create_account(user)
      expect(account).to be_a(BankAccount)
      expect(bank_system.accounts).to include(account)
    end
  end

  describe '#initialize' do
    it 'initialize @accounts' do
      bank_system = BankSystem.new
      expect(bank_system.instance_variable_get(:@accounts)).to eq([])
    end
  end

  describe '#display_accounts' do
    let(:user1) { User.new("Naruto Uzumaki", "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6") }
    let(:user2) { User.new("Itachi Uchiha", "Software Engineer", "itachi.hokage@yahoo.com", "Emil Racovita Street No 6") }
    let(:bank_system) { BankSystem.new }

    before do
      @bank_account1 = bank_system.create_account(user1)
      @bank_account2 = bank_system.create_account(user2)
    end

    it 'display all account-related information' do
      expected_output = <<~OUTPUT
        Account number 1:
        Personal data
        Name: Naruto Uzumaki
        Job: Software Engineer
        Email: naruto.hokage@yahoo.com
        Address: Emil Racovita Street No 6
        Balance: 0.0$
        Daily withdrawal limit rest: 5000$
        PIN: 
        -----
        Account number 2:
        Personal data
        Name: Itachi Uchiha
        Job: Software Engineer
        Email: itachi.hokage@yahoo.com
        Address: Emil Racovita Street No 6
        Balance: 0.0$
        Daily withdrawal limit rest: 5000$
        PIN: 
        -----
      OUTPUT
      expect { bank_system.display_accounts }.to output(expected_output).to_stdout
    end
  end

  describe '#find_account_by_name' do
    it 'get account with corresponding name' do
      user = User.new("Naruto Uzumaki", "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6")
      account = bank_system.create_account(user)
      found_account = bank_system.find_account_by_name("Naruto Uzumaki")
      expect(found_account).to eq(account)
    end
    
    it 'nil returned when no account corresponds to name' do
      found_account = bank_system.find_account_by_name('Name which does not exist')
      expect(found_account).to be_nil
    end
  end
end
