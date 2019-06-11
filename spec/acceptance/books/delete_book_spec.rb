require 'rails_helper'

feature 'admin can delete books', %q{
  In order to delete books
  As an admin
  I want to delete books
} do

  given(:user) { create(:user) }
  given!(:book) { create(:book) }

  scenario 'user try to delete book' do
    sign_in(user)

    visit books_path
    click_on 'Delete'

    expect(page).to have_content "Your book successfully deleted"
    expect(page).to have_no_content book.title
    expect(page).to have_no_content book.info
  end
end
