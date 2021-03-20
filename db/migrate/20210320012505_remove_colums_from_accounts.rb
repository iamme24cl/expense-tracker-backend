class RemoveColumsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :total_income, :float
    remove_column :accounts, :total_expense, :float
  end
end
