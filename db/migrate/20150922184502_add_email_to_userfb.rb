class AddEmailToUserfb < ActiveRecord::Migration
  def change
  	add_column :userfbs, :email, :string
  end
end
