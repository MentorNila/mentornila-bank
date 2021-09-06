class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :client, null: false, foreign_key: true
      t.string :account_number
      t.decimal :balance
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
