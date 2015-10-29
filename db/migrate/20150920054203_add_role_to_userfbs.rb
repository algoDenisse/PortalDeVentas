class AddRoleToUserfbs < ActiveRecord::Migration
  def change
  	add_column :userfbs, :role, :integer
  end
end
