class Review < ActiveRecord::Base
	belongs_to :reviewable, polymorphic: true
	belongs_to :article
	enum state: [:approved, :banned]
	after_initialize :set_default_state, :if => :new_record?

	def set_default_state
     self.state ||= :approved
    end
end
