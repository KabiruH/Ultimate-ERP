class UsersController < ApplicationController
   
    # before_action :session_expired?
    # GET /users
    def index
        #get users
        render json: User.all, status: :ok
    end    

    # GET /users/{id}
    def show
        #check if user is present
        user = User.find_by(id:params[:id])
        #return user
        if user
            render json: user, status: :ok
        #throw error
        else    
            render json: { error: "User not found" }, status: :not_found
        end
    end

 # POST /users

 def new
    @user = User.new
    render :new
  end


def create
    # Create a new user with the provided parameters
    @user = User.new(user_params)
    # @user.password = params[:user][:password]
  
    # Attempt to save the user to the database
    if @user.save
    
      # Save the user ID to the session
      save_user(@user.id)
      
  
      # Render a JSON response indicating success
      redirect_to user_path(@user), status: :created
    else
      # Render a JSON response with error messages if user creation fails
      render :new, status: :unprocessable_entity
    end
  end
  
    # PUT/PATCH /users/{id}
    def update
        # check whether the task exists
        user = User.find_by(id:params[:id])

        if user
            user.update(user_params)
            # return it
            render json: user, status: :accepted
        else
            # throw a not found error
            render json: {error: "User not found"}, status: :not_found
        end
    end

    # DELETE
    def destroy
        # check whether the task exists
        user = User.find_by(id: user_params[:id])
       
       #  delete the task
       if user
           user.destroy
           head :no_content
       #  return a not found user
       else 
           render json: {error: 'User not found'}, status: not_found
       end
    end

    # AUTHENTICATE A USER
    def login
        # Find the user by email
        user = User.find_by(email: user_params[:email])
      
        # Check if the user exists
        if user
          render json: { user: user }, status: :ok
        else
          render json: { error: 'User not found' }, status: :not_found
        end
      end
      

    # logout user
    def logout
        remove_user
        render json: {message: 'Logout successful'}
    end
    # GET ALL EVENTS RELATED TO A USER ID
    def get_all_user_events
    end

     private

     def user_params
        params.require(:user).permit(:username, :email, :password)
      end
      
end