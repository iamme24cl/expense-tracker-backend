class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :amount, :kind, :account
end
