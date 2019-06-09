require 'rails_helper'

RSpec.describe RentBook, type: :model do
  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_rent_time) }
    it { should validate_presence_of(:end_rent_time) }
  end
end
