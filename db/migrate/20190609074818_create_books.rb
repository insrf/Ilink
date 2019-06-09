class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.integer :parent_id
      t.string :title
      t.text :info

      t.timestamps
    end
  end
end
