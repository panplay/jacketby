class ArrivalItem < ApplicationRecord

	belongs_to :item

	validates :arrival_count, numericality: { only_interger: true }
