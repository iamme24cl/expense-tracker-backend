class AddColumnsToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :total_income, :float
    add_column :accounts, :total_expense, :float
  end
end
