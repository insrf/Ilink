require 'rails_helper'

feature 'Update book', %q{
  As an admin
  I want to be update book
} do

  given(:user) { create(:user) }
  given!(:book) { create(:book) }

  scenario 'admin update book' do
      sign_in(user)

      visit books_path
      click_on 'Edit'
      fill_in 'Title', with: 'Another title book'
      fill_in 'Info', with: 'Another text'
      click_on 'Update Book'

      expect(page).to have_content 'Your book successfully updated.'
      expect(page).to have_content 'Another title book'
      expect(page).to have_content 'Another text'
    end

    # TODO: scenario "Non-authenticated user update book" do
    #   visit books_path
    #
    #   expect(page).to_not have_link 'Edit'
    # end

    scenario 'Admin updated book with invalid attributes' do
        sign_in(user)

        visit books_path
        click_on 'Edit'
        fill_in 'Title', with: ''
        fill_in 'Info', with: ''
        click_on 'Update Book'

        expect(page).to have_content "Title can't be blank"
    end
  end
