class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end



  def new
  end

  def create
  end
end
