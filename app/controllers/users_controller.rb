class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
    
    def edit 
        is_matching_login_user
        @user = User.find(params[:id])
        
    end
    
    def index
       @user = User.all 
       @users = current_user
       @book = Book.new
    end 
       
    def show
       @user = User.find(params[:id])
       @book = @user.books 
       @book_new = Book.new
       @current_user = current_user
    end
    
    def update
    is_matching_login_user
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
    params.require(:user).permit(:name, :email, :profile, :profile_image, :introduction	)
    end
       
    def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
    end
end