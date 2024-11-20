class PagesController < ApplicationController
  def home
  end
  
  def style
  end

  def dashboard
    @user = current_user
    #@books = Book.where(user: @user)
    @books = @user.books
    @bookings_as_booker = @user.bookings
    #@bookings_as_owner = Booking.where(book.user_id: @user)
  end
end
