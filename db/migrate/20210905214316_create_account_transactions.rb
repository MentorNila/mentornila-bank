class CreateAccountTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :account_transactions do |t|
      t.string :transaction_number
      t.references :account, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type
      t.string :description
      t.references :transfer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
