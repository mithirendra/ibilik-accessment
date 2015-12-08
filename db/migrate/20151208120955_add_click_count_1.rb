class AddClickCount1 < ActiveRecord::Migration
	def change
		add_column :properties, :click_count, :integer, default: 0
	end
end
