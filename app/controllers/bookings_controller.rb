class BookingsController < ApplicationController
  before_action :set_book, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.book = @book
    @booking.user = current_user
    if @booking.save
      redirect_to book_path(@book), notice: 'Booking created successfully!'
      @book.update(status: "booked") 
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:preferred_pickup_location, :renting_period)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
