class User < ApplicationRecord
  has_many :rent_books

  validates :name, :password, presence: true
  validates :name, uniqueness: true
end
