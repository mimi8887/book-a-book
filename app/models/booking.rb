class Booking < ApplicationRecord
  belongs_to :book_id
  belongs_to :user_id
  validates :status, presence: true
end
