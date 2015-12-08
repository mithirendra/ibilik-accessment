class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.integer :location
			t.string :property_title
			t.string :property_desc
			t.string :extras
			t.string :preference
			t.integer :rental, default: 0
			t.integer :user_id, default: 0

			t.timestamps null: false
		end
	end
end
