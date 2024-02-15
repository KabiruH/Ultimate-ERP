class OrdersController < ApplicationController
    before_action :authenticate_customer!
  
    def index
      @orders = current_customer.orders
      render json: @orders, status: :ok
    end
  
    def show
      @order = Order.find(params[:id])
      authorize @order # Ensure customer can access their own order
      render json: @order, status: :ok
    end
  
    def create
      @order = current_customer.orders.new(order_params)
  
      if @order.save
        render json: @order, status: :created
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      @order = Order.find(params[:id])
      authorize @order # Ensure customer can update their own order
      if @order.update(order_params)
        render json: @order, status: :ok
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @order = Order.find(params[:id])
      authorize @order # Ensure customer can delete their own order
      @order.destroy
      render json: { message: "Order deleted" }, status: :no_content
    end
  
    private
  
    def order_params
      params.require(:order).permit(:items, :total_amount)
    end
  end
  