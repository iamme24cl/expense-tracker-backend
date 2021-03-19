class Transaction < ApplicationRecord
  belongs_to :account
  validates :description, :amount, :kind, presence: true
  validates :kind, inclusion: { in: %w(income expense), message: "Kind must be income or expense" }
end
