class PagesController < ApplicationController
  def home
  end

  def dashboard
    @books = Book.all
      if params[:id].present?
        @user = User.find(params[:id]) # Find the user by ID
      else
        @user = current_user # Default to current_user
      end
  end

  def style
  end
end
