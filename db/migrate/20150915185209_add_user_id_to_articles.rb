class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :articleable, polymorphic: true, index: true
  end
end
