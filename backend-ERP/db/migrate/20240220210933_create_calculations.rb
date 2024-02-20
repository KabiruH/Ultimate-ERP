class CreateCalculations < ActiveRecord::Migration[7.0]
  def change
    create_table :calculations do |t|
      t.date :date, null: false
      t.decimal :net_profit_loss, precision: 10, scale: 2, null: false
      t.decimal :revenue, precision: 10, scale: 2, null: false
      t.decimal :expenses, precision: 10, scale: 2, null: false
      t.decimal :sales, precision: 10, scale: 2, null: false
      t.decimal :accounts_receivable, precision: 10, scale: 2, null: false
      t.decimal :accounts_payable, precision: 10, scale: 2, null: false
      t.references :profit_loss_statement, foreign_key: true, index: true
      # Add other foreign keys if needed
      t.timestamps
    end
  end
end
