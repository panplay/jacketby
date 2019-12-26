class Room < ApplicationRecord
	has_many :customer_rooms
	has_many :customers, through: :customer_rooms
	has_many :posts
end
