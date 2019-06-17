class ChangeStartAndEndRentTimes < ActiveRecord::Migration[5.1]
  def up
    remove_column :rent_books, :start_rent_time
    add_column :rent_books, :start_rent_time, :datetime
    remove_column :rent_books, :end_rent_time
    add_column :rent_books, :end_rent_time, :datetime
  end

  def down
    remove_column :rent_books, :start_rent_time
    add_column :rent_books, :start_rent_time, :time
    remove_column :rent_books, :end_rent_time
    add_column :rent_books, :end_rent_time, :time
  end
end
