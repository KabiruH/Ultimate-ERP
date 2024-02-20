# app/controllers/profit_loss_statements_controller.rb

class ProfitLossStatementsController < ApplicationController
  include ProfitLossStatementsHelper

  def new
    @profit_loss_statement = ProfitLossStatement.new
  end

  def create
    @profit_loss_statement = ProfitLossStatement.new(profit_loss_statement_params)

    if @profit_loss_statement.save
      redirect_to profit_loss_statements_path, notice: 'Profit Loss Statement was successfully created.'
    else
      render :new
    end
  end

  def index
    @profit_loss_statement = ProfitLossStatement.find(params[:id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @profit_loss_data = @profit_loss_statement.generate_profit_loss_data(@start_date, @end_date)
  end

  def download_csv
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @profit_loss_statement = ProfitLossStatement.find(params[:id])
    @profit_loss_data = @profit_loss_statement.generate_profit_loss_data(@start_date, @end_date)

    # Generate CSV data
    csv_data = generate_csv_data(@profit_loss_data)

    # Send the CSV data to the browser
    send_data csv_data,
              filename: "profit_loss_statement_#{@start_date}_to_#{@end_date}.csv",
              type: "text/csv",
              disposition: "attachment"
  end

  private

  def profit_loss_statement_params
    params.require(:profit_loss_statement).permit(:revenue, :expenses, :sales, :accounts_receivable, :accounts_payable)
  end
end
