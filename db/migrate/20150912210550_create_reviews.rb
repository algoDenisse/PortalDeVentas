class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      
      #t.belongs_to :article, index: true, foreign_key: true
      #t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
