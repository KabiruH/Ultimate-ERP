class AddAttributesToProfitLossStatement < ActiveRecord::Migration[7.1]
  def change
    add_column :profit_loss_statements, :revenue, :decimal
    add_column :profit_loss_statements, :expenses, :decimal
    add_column :profit_loss_statements, :sales, :decimal
    add_column :profit_loss_statements, :accounts_receivable, :decimal
    add_column :profit_loss_statements, :accounts_payable, :decimal
  end
end
