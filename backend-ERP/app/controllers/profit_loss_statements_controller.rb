# app/controllers/profit_loss_statements_controller.rb

class ProfitLossStatementsController < ApplicationController
  

  def new
    @profit_loss_statement = ProfitLossStatement.new
  end

  def create
    @profit_loss_statement = ProfitLossStatement.new(profit_loss_statement_params)
  puts "start of creation"
    respond_to do |format|
      if @profit_loss_statement.save
        format.html { redirect_to profit_loss_statements_path, notice: 'Profit Loss Statement was successfully created.' }
        format.json { render :show, status: :created, location: @profit_loss_statement }
        puts "begin of if"
      else
        format.html { render :new }
        format.json { render json: @profit_loss_statement.errors, status: :unprocessable_entity }
        puts "end of if"
      end
    end
    puts "end of creation"
  end
  
  def show
    @profit_loss_statement = ProfitLossStatement.find(params[:id]) # Modify query if needed
    @calculation = @profit_loss_statement.calculation
    respond_to do |format|
      # Render JSON with appropriate attributes
      format.json { render json: @profit_loss_statement, only: [:id, :date, :name, :amount, :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable], status: :ok }
  
      # Render specific response structure if needed
      # format.json { render json: @calculated_data, status: :ok }
  
      rescue ActiveRecord::RecordNotFound
        render plain: 'Profit loss statement not found', status: :not_found
      end
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
    params.require(:profit_loss_statement).permit(:date, :name, :amount, :revenue, :expenses, :sales, :accounts_receivable, :accounts_payable)
  end

 end
