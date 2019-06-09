class CreateRentBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_books do |t|
      t.integer :book_id
      t.integer :user_id
      t.time :start_rent_time
      t.time :end_rent_time

      t.timestamps
    end
  end
end
