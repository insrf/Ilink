require 'rails_helper'

feature 'Rent book', %q{
  As an user
  I want to be able to rent book
} do

  given(:user) { create(:user) }
  given!(:book) { create(:book) }

  scenario 'user rents book' do
      sign_in(user)

      visit root_path
      click_on 'Rent'
      fill_in 'Start rent time', with: Time.now
      fill_in 'End rent time', with: Time.now + 2.hour
      click_on 'Create Rent book'

      expect(page).to have_content 'Your rent_book successfully created.'
      expect(page).to have_content book.id
      expect(page).to have_content user.id
    end

    scenario 'user take book with invalid attributes' do
        sign_in(user)

        visit root_path
        click_on 'Rent'
        fill_in 'Start rent time', with: ''
        fill_in 'End rent time', with: ''
        click_on 'Create Rent book'

        expect(page).to have_content "Start rent time can't be blank"
        expect(page).to have_content "End rent time can't be blank"
    end
  end
