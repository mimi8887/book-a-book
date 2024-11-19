class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :book_id
  validates :content, presence: true
end
