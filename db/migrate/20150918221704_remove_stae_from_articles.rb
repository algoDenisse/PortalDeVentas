class RemoveStaeFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :state, :integer
  end
end
