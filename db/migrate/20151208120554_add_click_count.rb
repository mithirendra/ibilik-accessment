class AddClickCount < ActiveRecord::Migration
	def change
		add_column :properties, :click_count, :integer
	end
end
