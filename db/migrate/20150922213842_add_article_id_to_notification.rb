class AddArticleIdToNotification < ActiveRecord::Migration
  def change
  	add_reference :notifications, :article, index: true, foreign_key: true
  end
end
