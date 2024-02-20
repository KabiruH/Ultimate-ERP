class Calculation < ApplicationRecord
    belongs_to :profit_loss_statement
    belongs_to :balance_sheet
    belongs_to :trial_balance
  
    # Define attributes:
    validates :date, :net_profit_loss, :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable, presence: true
  
    # Add additional attributes as needed
  end
  