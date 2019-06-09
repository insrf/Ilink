require 'rails_helper'

feature 'Users can see books list', %q{
  In order to see books
  As an Non-authenticated user
  I want to see books
} do

  given(:user) { create(:user) }
  given!(:books) { create_list(:generate_book, 4) }

  scenario 'authenticated user see books' do
    sign_in(user)

    visit books_path

    books.each do |book|
      expect(page).to have_content book.title
    end
  end

  scenario 'Non-authenticated user see books' do
    visit books_path

    books.each do |book|
      expect(page).to have_content book.title
    end
  end
end
