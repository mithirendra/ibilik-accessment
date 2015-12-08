class CreateBookings2 < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.string :booking
			t.integer :property_id, default: 0
			t.integer :user_id, default: 0

			t.timestamps null: false
		end
	end
end
