class AddNewColumnsToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :total_income, :float, :default => 0.0
    add_column :accounts, :total_expense, :float, :default => 0.0
  end
end
