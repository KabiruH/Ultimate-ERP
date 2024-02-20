class ProfitLossStatement < ApplicationRecord
  # Define attributes
  validates :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable, presence: true
  
  attr_accessor :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable
  
 # Method to generate profit and loss data
 def generate_profit_loss_data
  # Calculate profit loss data based on provided parameters
  revenue = self.revenue.to_f
  expenses = self.expenses.to_f
  sales = self.sales.to_f
  accounts_receivable = self.accounts_receivable.to_f
  accounts_payable = self.accounts_payable.to_f

  # Calculate net profit/loss
  net_profit_loss = sales + revenue - expenses

  # Return the calculated profit loss data
  {
    revenue: revenue,
    expenses: expenses,
    sales: sales,
    accounts_receivable: accounts_receivable,
    accounts_payable: accounts_payable,
    net_profit_loss: net_profit_loss
  }
end
end
