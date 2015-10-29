class AddStateToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :state, :integer
  end
end
