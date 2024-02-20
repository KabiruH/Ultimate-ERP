class CreateProfitLossStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :profit_loss_statements, id: :bigint do |t|
      t.datetime :date
      t.string :name
      t.integer :amount
      t.integer :revenue
      t.integer :expenses
      t.integer :sales
      t.integer :accounts_receivable
      t.integer :accounts_payable

      t.timestamps

      # Add indexes
      t.index :date # Assuming you often query by date range
      t.index :id, unique: true # Unique index for efficient ID retrieval
    end
  end
end
