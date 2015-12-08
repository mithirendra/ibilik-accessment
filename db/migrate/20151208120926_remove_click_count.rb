class RemoveClickCount < ActiveRecord::Migration
	def change
		remove_column :properties, :click_count, :integer
	end
end
