class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(list_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:book).permit(:title, :author, :description, :condition)
  end
end
"#{book.first_name} #{book.last_name}"
