class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :product_title ,null:false
    	t.string :location,null:false
    	t.string :room_type,null:false
    	t.string :amenities,null:false
    	t.string :availability,null:false
    	t.integer :product_rating,null:false
    	t.integer :price_rates,null:false
    	t.integer :guests_number,null:false
    	t.references :user, foreign_key:true

    	t.timestamps
    end
  end
end
