class SetLikesToArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :likes, :integer, :default => 0
  end
end
