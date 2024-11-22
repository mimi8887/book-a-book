class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    if params[:query].present?
      @books = @books.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book), notice: 'Book posted successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :condition, :photo, :user_id)
  end
end
