class CustomersController < ApplicationController
  before_action :authenticate_user!  # Ensure authentication in all actions

  # POST: Create a new customer
  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST: Login existing customer (using Devise or custom implementation)
  def login
    # Assuming Devise:
    customer = User.find_by_email(params[:email])
    if customer&.valid_password?(params[:password])
      # Generate JWT token (using a dedicated gem like `jwt`)
      token = JWT.encode({ customer_id: customer.id }, Rails.application.secrets.secret_key_base)
      customer_response = { id: customer.id, email: customer.email, name: customer.name }
      render json: { customer: customer_response, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end

    # Or, with custom login implementation:
    # ... authenticate customer, generate token, etc.
  end

  # GET: List all customers (with appropriate authorization checks)
  def index
    # Implement authorization (e.g., restrict to admin users)
    customers = Customer.all
    render json: customers, status: :ok
  end

  # GET: Show a specific customer by ID (with authorization checks)
  def show
    # Implement authorization (e.g., only logged-in customer can view their own profile)
    customer = Customer.find(params[:id])
    render json: customer, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Customer not found" }, status: :not_found
  end

  # GET: Search customers by name (with authorization checks)
  def search
    # Implement authorization (e.g., limit search scope)
    customers = Customer.where("name ILIKE ?", "%#{params[:name]}%")
    render json: customers, status: :ok
  end

  # PUT: Update a customer's profile (with authorization checks)
  def update
    customer = Customer.find(params[:id])
    # Implement authorization (e.g., only customer can update their own profile)
    if customer.update(customer_params)
      render json: customer, status: :ok
    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE: Delete a customer (with authorization checks and careful consideration)
  def destroy
    customer = Customer.find(params[:id])
    # Implement authorization (e.g., only authorized users with deletion permissions)
    # Consider soft delete or data anonymization instead of permanent deletion
    if customer.destroy
      render json: { message: "Customer deleted" }, status: :no_content
    else
      render json: { error: "Failed to delete customer" }, status: :internal_server_error
    end
  end

  # POST: Logout (remove session or invalidate token)
  def logout
    # Assuming Devise:
    sign_out
    render json: { message: 'Logout successful' }, status: :ok

    # Or, with custom implementation:
    # ... invalidate token, clear session, etc.
  end

  private

  def customer_params
    params.permit(:username, :email, :password)
  end
end
