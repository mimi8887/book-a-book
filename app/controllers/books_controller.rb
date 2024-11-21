class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    #@books = @user.books
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity, notice: 'Booking created successfully!'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :condition)
  end
end
