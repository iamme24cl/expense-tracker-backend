class Account < ApplicationRecord
  has_many :transactions
  validates :name, presence: true

  def update_balance(transaction)
    if transaction[:kind].downcase == "income" 
      self.balance += transaction[:amount]
      self.total_income += transaction[:amount]
    else
      self.balance -= transaction[:amount]
      self.total_expense += transaction[:amount]
    end
  end

end
