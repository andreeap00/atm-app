require_relative '../bank_account.rb'
require_relative '../user'

RSpec.describe BankAccount do
  let(:user) { User.new("Naruto Uzumaki",  "Software Engineer", "naruto.hokage@yahoo.com", "Emil Racovita Street No 6") }
  subject { BankAccount.new(user) }

  describe '#initialize' do
    it 'creates bank account with no money' do
      expect(subject.balance).to eq(0.0)
    end
    it 'remaining daily withdrawal limit = 5000 when initialized' do
      expect(subject.remaining_daily_withdrawal_limit).to eq(5000)
    end
  end

  describe '#set_pin' do
    it 'sets the PIN' do
      subject.set_pin('0000')
      expect(subject.pin).to eq('0000')
    end
  end

  describe '#valid_pin?' do
    context 'when PIN not set' do
      it 'returns false' do
        expect(subject.valid_pin?).to be_falsey
      end
    end

    context 'when PIN is set' do
      it 'requests PIN; if match, true is returned' do
        subject.set_pin('1111')
        allow($stdin).to receive(:gets).and_return('0111')
        expect(subject.valid_pin?).not_to be_truthy
      end

      it 'requests PIN; if not match, false is returned' do
        subject.set_pin('0000')
        allow($stdin).to receive(:gets).and_return('0001')
        expect(subject.valid_pin?).to be false
      end
     end
  end

  context 'when the money is a positive number' do
    it 'returns true' do
      expect(subject.valid_amount?(100)).to be_truthy
      expect(subject.valid_amount?(100.55)).to be_truthy
      expect(subject.valid_amount?("100")).to be_truthy
    end
  end
end
