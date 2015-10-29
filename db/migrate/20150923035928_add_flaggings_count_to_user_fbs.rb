class AddFlaggingsCountToUserFbs < ActiveRecord::Migration
  def change
  	add_column :userfbs, :flaggings_count, :integer
  end
end
