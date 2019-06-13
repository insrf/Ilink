class AddAncestryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :ancestry, :string
    add_index :books, :ancestry
  end
end
