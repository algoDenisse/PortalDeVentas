class AddImageableToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :imageable, polymorphic: true, index: true
  end
end
