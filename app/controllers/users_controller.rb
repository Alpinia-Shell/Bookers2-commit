class UsersController < ApplicationController

  def  index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end 

  def  show
    @user = current_user
    @book = Book.new
    @books = current_user.books
  end
end
