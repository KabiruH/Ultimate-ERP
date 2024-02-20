# app/controllers/profit_loss_statements_controller.rb

class ProfitLossStatementsController < ApplicationController
  include ProfitLossStatementsHelper

  def new
    @profit_loss_statement = ProfitLossStatement.new
  end

  def create
    binding.pry
    @revenue = params[:profit_loss_statement][:revenue].to_f
    @expenses = params[:profit_loss_statement][:expenses].to_f
    @sales = params[:profit_loss_statement][:sales].to_f
    @accounts_receivable = params[:profit_loss_statement][:accounts_receivable].to_f
    @accounts_payable = params[:profit_loss_statement][:accounts_payable].to_f
  
    @profit_loss_data = ProfitLossStatement.generate_data(
      @revenue, @expenses, @sales, @accounts_receivable, @accounts_payable
    )
  
    render :index
  end

  def index
    @profit_loss_statements = ProfitLossStatement.all
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @profit_loss_data = @profit_loss_statements.map(&:generate_profit_loss_data)
  end

  # def download_csv
  #   @start_date = params[:start_date]
  #   @end_date = params[:end_date]
  #   @profit_loss_statement = ProfitLossStatement.find(params[:id])
  #   @profit_loss_data = @profit_loss_statement.generate_profit_loss_data(@start_date, @end_date)

  #   # Generate CSV data
  #   csv_data = generate_csv_data(@profit_loss_data)

  #   # Send the CSV data to the browser
  #   send_data csv_data,
  #             filename: "profit_loss_statement_#{@start_date}_to_#{@end_date}.csv",
  #             type: "text/csv",
  #             disposition: "attachment"
  # end

  private

  def profit_loss_statement_params
    params.require(:profit_loss_statement).permit(:revenue, :expenses, :sales, :accounts_receivable, :accounts_payable)
  end
end
