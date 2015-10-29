class AddArticleIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :article, index: true, foreign_key: true
  end
end
