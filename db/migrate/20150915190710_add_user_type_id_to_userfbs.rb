class AddUserTypeIdToUserfbs < ActiveRecord::Migration
  def change
    add_reference :userfbs, :user_type, index: true, foreign_key: true
  end
end
