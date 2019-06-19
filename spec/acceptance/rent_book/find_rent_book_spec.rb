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

  scenario 'user try find rent book with only end_date parameter' do
      sign_in(user)

      visit rent_books_path

      fill_in 'end_date',  with: Time.now
      click_on 'search'

      expect(page).to have_content book.title
      expect(page).to have_content user.email
    end

    scenario 'user try find rent book with only start_date parameter' do
      sign_in(user)

      visit rent_books_path

      fill_in 'start_date',  with: Time.now
      click_on 'search'

      expect(page).to have_content book.title
      expect(page).to have_content user.email
    end

    scenario 'user try find rent book with only select book ' do
      sign_in(user)

      visit rent_books_path

      page.check(book.id) 
      click_on 'search'

      expect(page).to have_content book.title
      expect(page).to have_content user.email
    end
  end
