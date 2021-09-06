class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.references :transferor, foreign_key: {to_table: :accounts}
      t.references :transferee, foreign_key: {to_table: :accounts}
      t.date :execution_date

      t.timestamps
    end
  end
end
