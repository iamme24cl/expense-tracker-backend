class RemoveBalanceFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :balance, :float
  end
end
