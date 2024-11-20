class Book < ApplicationRecord
    # has_many :bookings, :reviews
    belongs_to :user
    has_many :reviews
    # validates :description, :title, :condition, :author, presence: true
end
