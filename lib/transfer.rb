class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? == true && self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    elsif
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

def reverse_transfer
  if self.status == "complete"
    sender.balance += self.amount
    receiver.balance -= self.amount
    self.status = "reversed"
  end
end

end
#execute_transaction
    #   can execute a successful transaction between two accounts (FAILED - 1)
    #   each transfer can only happen once (FAILED - 2)
    #   rejects a transfer if the sender doesn't have a valid account (FAILED - 3)
#reverse_transfer
    #   can reverse a transfer between two accounts (FAILED - 4)
    #   it can only reverse executed transfers (FAILED - 5)
