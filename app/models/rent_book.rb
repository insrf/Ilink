class RentBook < ApplicationRecord
  include Filterable

  belongs_to :book
  belongs_to :user

  validates :start_rent_time, :end_rent_time, presence: true

  scope :start_date, ->(time) { where("start_rent_time <= ?", time) }
  scope :end_date, ->(time) { where("end_rent_time >= ?", time) }
  scope :book_ids, ->(ids) { where(book_id: ids) }
end
