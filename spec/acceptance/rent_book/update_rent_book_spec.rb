require 'rails_helper'

feature 'Update rent', %q{
  As an user
  I want to be update rent
} do

  given(:user) { create(:user) }
  given(:book) { create(:book) }
  given!(:rent_book) { create(:rent_book, book_id: book.id, user_id: user.id) }

  scenario 'user update book' do
      sign_in(user)

      visit book_rent_books_path(rent_book.book)
      click_on 'Edit'
      fill_in 'Start rent time', with: Time.now
      fill_in 'End rent time', with: Time.now + 2.hour
      click_on 'Update Rent book'

      expect(page).to have_content 'Your rent_book successfully updated.'
    end

  scenario 'User updated book with invalid attributes' do
      sign_in(user)

      visit book_rent_books_path(rent_book.book)
      click_on 'Edit'
      fill_in 'Start rent time', with: ''
      fill_in 'End rent time', with: ''
      click_on 'Update Rent book'

      expect(page).to have_content "Start rent time can't be blank"
      expect(page).to have_content "End rent time can't be blank"
  end
end
