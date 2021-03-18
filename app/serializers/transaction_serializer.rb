class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :amount, :kind, :account_id
end
