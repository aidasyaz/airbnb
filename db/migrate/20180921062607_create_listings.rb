class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :product_title
    	t.string :location
    	t.string :room_type
    	t.string :amenities
    	t.string :availability
    	t.integer :product_rating
    	t.integer :price_rates
    	t.integer :guests_number
    	t.references :user, foreign_key:true

    	t.timestamps
    end
  end
end
