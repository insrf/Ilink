class RentBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start_rent_time, :end_rent_time, presence: true

  scope :before_date, ->(time) { where("start_rent_time <= ?", time) }
  scope :after_date, ->(time) { where("end_rent_time >= ?", time) }
end
