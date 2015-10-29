class Article < ActiveRecord::Base
	make_flaggable 
	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true
	enum state: [:pending, :approved, :rejected]
	after_initialize :set_default_state, :if => :new_record?
	has_many :reviews
	has_many :notifications
	belongs_to :imageable, polymorphic: true
	belongs_to :category

	has_attached_file :image, styles: {medium: "1200x720", thumb: "400x200", mini: "400x200"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


	def set_default_state
     self.state ||= :pending
    end

  
    def self.search(search)
	  if search
	    where(["name LIKE ?","%#{search}%" ])
	  else
	    all
	  end
	end

	def self.search_by_category(category)
		if category
			where("category_id = #{category}")
		else
			all
		end
	end

end
