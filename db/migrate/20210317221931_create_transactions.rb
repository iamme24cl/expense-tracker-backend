class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.float :amount
      t.string :kind
      # t.references :account, null: false, foreign_key: true
      t.references :account, foreign_key: true


      t.timestamps
    end
  end
end
