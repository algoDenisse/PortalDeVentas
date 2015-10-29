class Userfb < ActiveRecord::Base
  make_flagger
  enum role: [:admin, :regularUser]
  after_initialize :set_default_role, :if => :new_record?

	has_many :articles, :as => :imageable
	has_many :reviews, :as => :reviewable
  has_many :notifications, :as => :notable
	belongs_to :usertype
	def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    user.email    = auth.info.email
    user.save
  end
end
def set_default_role
    self.role ||= :regularUser
  end
end
