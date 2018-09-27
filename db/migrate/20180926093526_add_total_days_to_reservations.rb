class AddTotalDaysToReservations < ActiveRecord::Migration[5.2]
  def change
  	add_column :reservations, :total_days, :integer
  end
end
