require 'rails_helper'

feature 'Create book', %q{
  As an admin
  I want to be able to add book
} do

  given(:admin) { create(:admin) }
  given(:user) { create(:user) }

  scenario 'Admin creates book' do
      sign_in(admin)

      visit admin_books_path
      click_on 'New'
      fill_in 'Title', with: 'Title book'
      fill_in 'Info', with: 'info book'
      click_on 'Create Book'

      expect(page).to have_content 'Your book successfully created.'
      expect(page).to have_content 'Title book'
      expect(page).to have_content 'info book'
    end

    scenario "Non-admin user try creates book" do
      visit admin_books_path

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
      expect(page).to_not have_content 'New'
    end

    scenario "Non-authenticated try user creates book" do
      sign_in(user)
      visit admin_books_path
      
      expect(page).to have_content 'You are not authorized to view this page.'
      expect(page).to_not have_content 'New'
    end

    scenario 'Admin creates book with invalid attributes' do
        sign_in(admin)

        visit admin_books_path
        click_on 'New'
        fill_in 'Title', with: ''
        click_on 'Create Book'

        expect(page).to have_content "Title can't be blank"
    end
  end
