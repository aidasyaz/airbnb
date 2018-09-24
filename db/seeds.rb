# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# seed users
user = {}
user['password'] = 'afsfd' 
# ?

ActiveRecord::Base.transaction do
	20.times do
		user['first_name'] = Faker::Name.first_name
		user['email'] = Faker::Internet.email
		User.create!(user)
	end
end

# seed listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
	150.times do
		listing['product_title'] = Faker::App.name
		listing['location']= Faker::Address.city
		listing['room_type']=["House", "Entire floor", "Condominium", "Villa", "Townhouse", "Treehoouse","Chalet","Hut","Tent"].sample
		listing['availability'] = Faker::Date.forward(50)
		listing['amenities'] = Faker::Hipster.sentence
		listing['price_rates'] = rand(180..400)
		listing['guests_number'] = rand(1..10)
		listing['user_id'] = uids.sample
	
		Listing.create!(listing)
	end
end