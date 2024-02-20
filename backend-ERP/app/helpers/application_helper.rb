module ApplicationHelper

    def download_profit_loss_csv(profit_loss_data)
      CSV.generate do |csv|
        # Add header row:
        csv << ['Revenue', 'Expenses', 'Sales', 'Accounts Receivable', 'Accounts Payable']
    
        # Add data rows:
        profit_loss_data.each do |statement|
          csv << [statement[:revenue], statement[:expenses], statement[:sales], statement[:accounts_receivable], statement[:accounts_payable]]
        end
      end
    end
  
  end
  