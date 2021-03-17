class Account < ApplicationRecord
  has_many :transactions
  validates :name, presence: true

  def update_balance
    self.balance = Account.joins(:transactions).where("transactions.account_id = ?", self.id).sum(:amount)
  end
end
