require_relative 'project'
RSpec.describe BankAccount do
    before(:each) do
        @client1 = BankAccount.new()
    end

    it 'has a method for checking account balance' do
        expect(@client1.getCheckingBalance).to eq(0)
    end 

    it 'has a method for getting the total balance' do
        expect(@client1.getTotalBalance).to eq(0)
    end

    it 'has a method for withdrawing money from checking' do
        @client1.checking_balance = 50
        expect(@client1.checkingWithdraw(15)).to eq(true)
    end

    it 'trying to retrieve more money than its available' do
        expect(@client1.checkingWithdraw(75)).to eq(false)
    end

    it 'trying to get total number of bank accounts' do
        expect(@client1.total_clients).to eq(nil)
    end
end