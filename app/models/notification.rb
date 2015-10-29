class Notification < ActiveRecord::Base
	belongs_to :notable, polymorphic: true
	belongs_to :article
end
