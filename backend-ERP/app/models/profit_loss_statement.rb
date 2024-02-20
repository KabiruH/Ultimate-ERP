require 'csv'

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

  # Method to generate CSV data
  def generate_csv_data(profit_loss_data)
    CSV.generate(headers: true) do |csv|
      csv << ['Sales', 'Revenue', 'Expenses', 'Net Profit/Loss']
      csv << [profit_loss_data[:sales], profit_loss_data[:revenue], profit_loss_data[:expenses], profit_loss_data[:net_profit_loss]]
    end
  end

  # Method to save CSV file
  def save_csv_file(csv_data)
    # Specify the file path where the CSV file will be saved
    file_path = Rails.root.join('public', 'profit_loss_statement.csv')
  
    # Write CSV data to the specified file path
    File.open(file_path, 'w') do |file|
      file.write(csv_data)
    end
  
    # Return the file path where the CSV file is saved
    file_path.to_s
  end
  
end
