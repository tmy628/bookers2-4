class ChangeDatatypeBookIdOfBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :book_id, :integer
  end
end
