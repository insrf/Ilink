class RentBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start_rent_time, :end_rent_time, presence: true

  def before_date(start_date)
    self.where("start_rent_time <= :start_date", start_date: start_date)
  end

  def after_date(end_date)
    self.where("end_rent_time <= :end_date", end_date: end_date)
  end
end
