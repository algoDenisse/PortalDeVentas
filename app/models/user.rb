class User < ActiveRecord::Base
  make_flagger
  enum role: [:admin, :regularUser]
  after_initialize :set_default_role, :if => :new_record?
  has_secure_password
  validates :name,
  			presence: true
  validates :email,
  			presence: true,
  		    uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  has_many :articles, :as => :imageable
  has_many :reviews, :as => :reviewable
  has_many :notifications, :as => :notable
  belongs_to :usertype

  def set_default_role
    self.role ||= :regularUser
  end

 
end
