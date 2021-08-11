# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Account.destroy_all
# Transaction.destroy_all



account = Account.create(name: "demo", password: "demo")

transactions_data = [
  { description: "paycheck", amount: 1500, kind: "income" },
  { description: "paycheck", amount: 1500, kind: "income" },
  { description: "Camera", amount: 500, kind: "expense" },
  { description: "dine out", amount: 80, kind: "expense" },
  { description: "gas", amount: 60, kind: "expense" },
  { description: "car loan payment", amount: 350, kind: "expense"}
]

transactions_data.each do |t|
  account.transactions.build(description: t[:description], amount: t[:amount], kind: t[:kind])
  account.update_balance(t)
  account.save
end







