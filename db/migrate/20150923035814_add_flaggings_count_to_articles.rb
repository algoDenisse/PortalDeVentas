class AddFlaggingsCountToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :flaggings_count, :integer
  end
end
