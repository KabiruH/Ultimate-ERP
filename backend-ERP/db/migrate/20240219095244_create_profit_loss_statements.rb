class CreateProfitLossStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :profit_loss_statements do |t|
      t.datetime :date
      t.string :name
      t.decimal :amount
      t.decimal :revenue
      t.decimal :expenses
      t.decimal :sales
      t.decimal :accounts_receivable
      t.decimal :accounts_payable

      t.timestamps
    end
  end
end
