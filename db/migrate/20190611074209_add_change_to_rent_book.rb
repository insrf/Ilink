class AddChangeToRentBook < ActiveRecord::Migration[5.1]
  def change
    add_index :rent_books, [:book_id, :user_id]
  end
end
