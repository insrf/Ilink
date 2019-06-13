class Book < ApplicationRecord
  has_many :rent_books
  has_ancestry
  
  validates :title, presence: true
  validates :title, uniqueness: true
end
