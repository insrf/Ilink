require 'rails_helper'

feature 'admin can delete books', %q{
  In order to delete books
  As an admin
  I want to delete books
} do

  given(:user) { create(:user) }
  given(:admin) { create(:admin) }
  given!(:book) { create(:book) }

  scenario 'Admin try to delete book' do
    sign_in(admin)

    visit admin_books_path
    click_on 'Delete'

    expect(page).to have_content "Your book successfully deleted"
    expect(page).to have_no_content book.title
    expect(page).to have_no_content book.info
  end

  scenario 'User try to delete book' do
    sign_in(user)

    visit admin_books_path

    expect(page).to have_content 'You are not authorized to view this page.'
    expect(page).to_not have_link 'Edit'
  end
end
