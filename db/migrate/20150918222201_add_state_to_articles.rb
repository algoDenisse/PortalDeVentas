class AddStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :state, :integer
  end
end
