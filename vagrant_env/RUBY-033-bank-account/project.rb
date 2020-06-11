class BankAccount
    @@total_clients = 0

    attr_accessor :checking_balance, :interest_rate

    def initialize 
        @account_number = generateAccountNumber
        @interest_rate = 0.01
        @saving_balance = 0
        @checking_balance = 0
        @@total_clients+=1

    end

    def generateAccountNumber
        aNumber = String.new
        for i in (1..16)
            aNumber += rand(0..9).to_s
        end
        return aNumber
    end

    def getAccountNumber
        return @account_number
    end

    def getCheckingBalance
        return @checking_balance
    end

    def checkingDeposit amount
        @checking_balance+=amount
        self
    end

    def checkingWithdraw amount
        if amount > @checking_balance
            return false
        else
            @checking_balance-=amount
            return true
        end
    end

    def getSavingBalance
        return @saving_balance
    end

    def savingDeposit amount
        @saving_balance+=amount
        self
    end

    def savingWithdraw amount
        if amount > @saving_balance
            return "Not enough funds in your account!"
        else
            return @saving_balance-=amount
        end
        self
    end

    def getTotalBalance
        return @saving_balance + @checking_balance
    end

    def getTotalClients
        return @@total_clients
    end

    def getAccountInformation
        puts "Account number: #{@account_number}"
        puts "Total balance: #{@checking_balance+@saving_balance}"
        puts "Checking account balance: #{@checking_balance}"
        puts "Savings account balance: #{@saving_balance}"
        puts "Interest rate: #{@interest_rate}"
    end
end

# client1 = BankAccount.new()
# client2 = BankAccount.new()
# client3 = BankAccount.new()
# client4 = BankAccount.new()
# client5 = BankAccount.new()
# puts client1.getAccountNumber

# client1.checkingDeposit(50).savingDeposit(100)
# puts client1.getCheckingBalance
# puts client1.getSavingBalance
# puts client1.getTotalBalance

# client1.checkingWithdraw(25).savingWithdraw(50).checkingWithdraw(125).savingWithdraw(250)
# puts client1.getCheckingBalance
# puts client1.getSavingBalance
# puts client1.getTotalBalance
# puts client1.getAccountInformation

# puts client1.getTotalClients