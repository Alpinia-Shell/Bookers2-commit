class BooksController < ApplicationController
  def index  
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end 

  def show
    @book = Book.new
    @a_book = Book.find(params[:id])
    @user = @a_book.user
  end

  def edit
    book = Book.find(params[:id])
    unless
    book.user == current_user
    redirect_to books_path
    end
    @book = Book.find(params[:id])
  end 

  def update
    @book = Book.find(params[:id])
    unless
    @book.user == current_user
    redirect_to books_path
    end 
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
    render :edit
    end 
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
