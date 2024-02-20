class TrialBalancesController < ApplicationController
    def index
      @trial_balances = TrialBalance.all
    end
  
    def show
      @trial_balance = TrialBalance.find(params[:id])
    end
  
    def new
      @trial_balance = TrialBalance.new
    end
  
    def create
      @trial_balance = TrialBalance.new(trial_balance_params)
      if @trial_balance.save
        redirect_to @trial_balance, notice: 'Trial balance was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @trial_balance = TrialBalance.find(params[:id])
    end
  
    def update
      @trial_balance = TrialBalance.find(params[:id])
      if @trial_balance.update(trial_balance_params)
        redirect_to @trial_balance, notice: 'Trial balance was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @trial_balance = TrialBalance.find(params[:id])
      @trial_balance.destroy
      redirect_to trial_balances_url, notice: 'Trial balance was successfully destroyed.'
    end
  
    private
  
    def trial_balance_params
      params.require(:trial_balance).permit(:date, :name, :amount)
    end
  end
  