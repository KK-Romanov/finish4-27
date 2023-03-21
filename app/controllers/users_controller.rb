class UsersController < ApplicationController
    
    def edit 
        @user = User.find(params[:id])
    end 
    
    def index
       @user = User.all 
       @users = current_user
    end 
       
    def show
       @user = User.find(params[:id])
       @book = @user.books 
       @book = Book.find(params[:id])
    end
    
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully"  
    redirect_to user_path(@user.id)
    else 
        flash[:notice] = "error"  
        render :edit
    end
    end
     private
  
    def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
    end
end
