class AddRentingPeriodAndPreferredPickupLocationToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :renting_period, :string
    add_column :bookings, :preferred_pickup_location, :string
  end
end
