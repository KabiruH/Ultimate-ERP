module ProfitLossStatementsHelper

    def generate_profit_loss_data
        # Calculate profit loss data based on sales, revenue, and expenses
        sales = @profit_loss_statement.sales.to_f
        revenue = @profit_loss_statement.revenue.to_f
        expenses = @profit_loss_statement.expenses.to_f
      
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
