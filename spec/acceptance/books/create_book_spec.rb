require 'rails_helper'

feature 'Create book', %q{
  As an admin
  I want to be able to add book
} do

  given(:user) { create(:user) }

  scenario 'admin creates book' do
      sign_in(user)

      visit books_path
      click_on 'New'
      fill_in 'Title', with: 'Title book'
      fill_in 'Info', with: 'text text'
      click_on 'Create Book'

      expect(page).to have_content 'Your book successfully created.'
      expect(page).to have_content 'Title book'
      expect(page).to have_content 'text text'
    end

    scenario "Non-authenticated user creates book" do
      visit books_path

      expect(page).to_not have_content 'New book'
    end

    scenario 'Admin user creates book with invalid attributes' do
        sign_in(user)

        visit books_path
        expect(page).to_not have_content 'New book'
    end
  end
