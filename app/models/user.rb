class User < ApplicationRecord
  include Clearance::User

  # can log many user
  has_many :authentications, dependent: :destroy
  # user has many lists created
  has_many :listings
  # user roles
  enum status: [:superadmin, :moderator, :customer]
  # user has 1 avatar
  mount_uploader :avatar, AvatarUploader


 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     email: auth_hash["info"]["email"],
     first_name: auth_hash["info"]["first_name"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end

end



