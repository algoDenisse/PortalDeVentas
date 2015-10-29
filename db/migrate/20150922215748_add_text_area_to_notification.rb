class AddTextAreaToNotification < ActiveRecord::Migration
  def change
  	add_column :notifications, :notification, :string
  end
end
