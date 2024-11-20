class AddPublishedAtToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :published_at, :date
  end
end
