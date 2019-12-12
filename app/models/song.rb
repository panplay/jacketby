class Song < ApplicationRecord

	belongs_to :disk

	validates :name, presence: true
end
