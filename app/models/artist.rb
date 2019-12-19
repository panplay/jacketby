class Artist < ApplicationRecord

	has_many :items

	validates :name, presence: true
	accepts_nested_attributes_for :items, allow_destroy: true

	def Artist.search(search, item_or_artist)
	  if item_or_artist == "2"
	     Artist.where(['name LIKE ?', "%#{search}%"])
	  else
	     Artist.all
  	  end
    end
end

