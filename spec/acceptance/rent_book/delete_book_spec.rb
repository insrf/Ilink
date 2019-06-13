require 'rails_helper'

feature 'user can return books', %q{
  In order to return books
  As an user
  I want to return books
} do

  given(:user) { create(:user) }
  given(:book) { create(:book) }
  given!(:rent_book) { create(:rent_book, book_id: book.id, user_id: user.id) }

  scenario 'user try to delete book' do
    sign_in(user)

    visit book_rent_books_path(rent_book.book)
    click_on 'Delete'

    expect(page).to have_content "Your rent_book successfully deleted"
    expect(page).to have_no_content rent_book.start_rent_time
    expect(page).to have_no_content rent_book.end_rent_time
  end
end
