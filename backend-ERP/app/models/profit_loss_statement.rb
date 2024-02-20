class ProfitLossStatement < ApplicationRecord
  # Define attributes
  attr_accessor :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable
  
  # Method to generate profit and loss data
  def generate_profit_loss_data
    # Calculate profit loss data based on sales, revenue, and expenses
    sales = self.sales.to_f
    revenue = self.revenue.to_f
    expenses = self.expenses.to_f
  
    # Calculate net profit/loss
    net_profit_loss = sales + revenue - expenses
  
    # Return the calculated profit loss data
    {
      sales: sales,
      revenue: revenue,
      expenses: expenses,
      net_profit_loss: net_profit_loss
    }
  end
end
