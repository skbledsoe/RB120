class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0  #should it be @balance or balance?
  end
end


#because we have a getter method, the balance instance variable in
#positive_balance method does not need an @ symbol

account = BankAccount.new(100)
puts "positive!" if account.positive_balance?