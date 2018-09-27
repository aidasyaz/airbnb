class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.date :start_date, null: false
    	t.date :end_date, null: false
    	t.integer :guest
    	t.integer :total_price

    	t.belongs_to :user, null: false
    	t.belongs_to :listing, null: false
    end
  end
end
