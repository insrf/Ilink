class RentBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start_rent_time, :end_rent_time, presence: true
end
