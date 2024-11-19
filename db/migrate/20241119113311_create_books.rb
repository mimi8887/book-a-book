class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :description
      t.string :title
      t.string :condition
      t.string :author

      t.timestamps
    end
  end
end
