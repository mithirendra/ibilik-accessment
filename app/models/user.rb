class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	attr_accessor :encrypted_password

	validates :email, uniqueness: true
	has_many :properties
	has_many :comments
	has_many :bookings
	# has_secure_password

end
