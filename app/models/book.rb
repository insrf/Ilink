class Book < ApplicationRecord
  has_many :rent_books

  validates :title, presence: true
  validates :title, uniqueness: true
end
