class RemovePublishedAtFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :published_at, :date
  end
end
