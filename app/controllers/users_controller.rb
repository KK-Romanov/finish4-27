class UsersController < ApplicationController
    
    def edit 
        @user = User.find(params[:id])
    end 
    
    def index
       @user = User.all  
    end 
       
    def show
       @user = User.find(params[:id])
       @book = @user.book  
    end
    
    def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(user.id)  
    end
     private
  
    def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
    end
end
