class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :property_title, presence: true
	validates :property_desc, presence: true
	belongs_to :user
	has_many :comments
	has_one :booking

end
