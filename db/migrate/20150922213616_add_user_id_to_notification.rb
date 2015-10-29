class AddUserIdToNotification < ActiveRecord::Migration
  def change
  	add_reference :notifications, :notable, polymorphic: true, index: true
  end
end
