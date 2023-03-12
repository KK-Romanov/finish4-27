class BooksController < ApplicationController
    def new
        @book = Book.new
    end
    
    def index
       @books = Book.all
       @book = Book.new
    end
    
    def create
        @book  = Book.new(book_params)
        @book.user_id = current_user.id
     if @book.save
         flash[:notice] = "successfully"
         redirect_to book_path(@book.id)
     else
        @books = Book.all  
        flash[:notice] = "error"
        render :index
     end
    end
    def show
        @books = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] = "successfully"  
        redirect_to book_path(@book.id)  
     else 
        flash[:notice] = "error"  
        render :edit
     end
    end
    def edit
        @book = Book.find(params[:id])
    end
    
    def destroy
        book = Book.find(params[:id])
     if book.destroy
        flash[:notice] = "削除が成功しました"  
        redirect_to '/books'
     end
    end
    
    private
     def book_params
        params.require(:book).permit(:title, :body, :image)
     end
   
  

end

