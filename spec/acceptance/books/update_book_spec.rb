require 'rails_helper'

feature 'Update book', %q{
  As an admin
  I want to be update book
} do

  given(:user) { create(:user) }
  given(:admin) { create(:admin) }
  given!(:book) { create(:book) }

  scenario 'Admin update book' do
      sign_in(admin)

      visit admin_books_path
      click_on 'Edit'
      fill_in 'Title', with: 'Another title book'
      click_on 'Update Book'

      expect(page).to have_content 'Your book successfully updated.'
      expect(page).to have_content 'Another title book'
    end

    scenario "User try update book" do
      sign_in(user)
      visit admin_books_path

      expect(page).to have_content 'You are not authorized to view this page.'
      expect(page).to_not have_link 'Edit'
    end

    scenario 'Admin updated book with invalid attributes' do
        sign_in(admin)

        visit admin_books_path
        click_on 'Edit'
        fill_in 'Title', with: ''
        click_on 'Update Book'

        expect(page).to have_content "Title can't be blank"
    end
  end
