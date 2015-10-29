class RemoveIndexFromArticles < ActiveRecord::Migration
  def change
    remove_index :articles, name: :index_articles_on_articleable_type_and_articleable_id
  end
end
