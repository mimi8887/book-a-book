class AddAddressAndNameToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :address, :string
    add_column :flats, :name, :string
  end
end
