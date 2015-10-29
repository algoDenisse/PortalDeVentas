class UserType < ActiveRecord::Base
	has_many :users
	has_many :userfbs
end
