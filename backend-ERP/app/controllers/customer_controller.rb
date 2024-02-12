class CustomerController < ApplicationController

    def create
        # Create a new customer object with permitted params
        @customer = Customer.new(customer_params)
      
        if @customer.save
          # Successful registration
      
          # Use Devise methods for password validation
          if @customer.valid_password?(customer_params[:password])
            # Generate JWT token with customer ID
            token = JWT.encode({ customer_id: @customer.id }, Rails.application.secrets.secret_key_base)
      
            # Return customer details and token
            render json: { customer: @customer, token: token }, status: :created
          else
            # Password validation failed
            render json: { error: "Invalid password" }, status: :unprocessable_entity
          end
        else
          # Customer creation failed due to other errors
          render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        # Find customer by email using Devise
        customer = User.find_by_email(user_params[:email])
      
        if customer && customer.valid_password?(user_params[:password])
          # Login successful, generate JWT token with customer ID
          token = JWT.encode({ customer_id: customer.id }, Rails.application.secrets.secret_key_base)
      
          # Exclude sensitive information from response
          customer_response = { id: customer.id, email: customer.email, name: customer.name }
      
          render json: { customer: customer_response, token: token }, status: :ok
        else
          # Login failed, return error message
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def index
        # Add authorization checks if needed
        customers = Customer.all
        render json: customers, status: :ok
      end
      
      # Find a specific customer by ID
      def show
        # Find customer and add authorization checks
        customer = Customer.find(params[:id])
        render json: customer, status: :ok
      end
      
      # Search customers by name
      def search
        # Apply search criteria and authorization checks
        customers = Customer.where("name ILIKE ?", "%#{params[:name]}%")
        render json: customers, status: :ok
      end

  # Updating a customer profile
      def update
        # Find customer and add authorization checks
        customer = Customer.find(params[:id])
      
        # Update attributes with permitted params
        if customer.update(customer_params)
          render json: customer, status: :ok
        else
          render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
        end
      end

# Delete a customer (consider soft delete or data anonymization)
    def destroy
    # Find customer and add authorization checks
    customer = Customer.find(params[:id])

    # Confirm deletion and perform necessary actions
    if customer.destroy
        render json: { message: "Customer deleted" }, status: :no_content
    else
        render json: { error: "Failed to delete customer" }, status: :internal_server_error
    end
    end

# logout user
    def logout
        remove_user
        render json: {message: 'Logout successful'}
    end
end
