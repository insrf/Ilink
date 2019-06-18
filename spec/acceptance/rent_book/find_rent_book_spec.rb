require 'rails_helper'

feature 'Find rent book', %q{
  As an user
  I want to be able to find a rent book
} do

  given(:user) { create(:user) }
  given!(:book) { create(:book) }
  given!(:rent_book) { create(:rent_book, book_id: book.id, user_id: user.id,
                                          start_rent_time: Time.now - 1.week,
                                          end_rent_time: Time.now + 1.week) }

  scenario 'user try find rent book' do
      sign_in(user)

      visit rent_books_path

      fill_in 'start_date', with:  Time.now
      fill_in 'end_date',  with: Time.now + 2.hour
      click_on 'search'

      expect(page).to have_content book.id
      expect(page).to have_content user.id
    end

    scenario 'user find book with invalid attributes' do
        sign_in(user)

        visit rent_books_path

        fill_in 'start_date', with: ''
        fill_in 'end_date', with: ''
        click_on 'search'


        expect(page).to have_content "Start date or End date cannot be empty"
    end
  end
