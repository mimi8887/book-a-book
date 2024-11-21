class RemoveCreatedAtFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :created_at, :datetime
  end
end
