class Label < ApplicationRecord

	has_many :items

	validates :name, presence: true
	accepts_nested_attributes_for :items, allow_destroy: true
end
