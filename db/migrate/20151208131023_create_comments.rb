class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :comment_desc
			t.integer :property_id, default: 0
			t.integer :user_id, default: 0
			t.integer :click_count, default: 0

			t.timestamps null: false
		end
	end
end
