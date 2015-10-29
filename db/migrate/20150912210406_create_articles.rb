class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :price
      t.integer :likes
      t.string :description
      t.integer :state
      
      #t.belongs_to :user, index: true, foreign_key: true
      #t.belongs_to :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
