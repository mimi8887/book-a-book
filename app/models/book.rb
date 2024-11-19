class Book < ApplicationRecord
    # has_many :bookings, :reviews
    belongs_to :user
    # validates :description, :title, :condition, :author, presence: true
end
