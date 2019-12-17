class Item < ApplicationRecord

	belongs_to :artist
	belongs_to :label
	belongs_to :category

	has_many :arrival_items
	has_many :disks, dependent: :destroy
	accepts_nested_attributes_for :arrival_items, allow_destroy: true
	accepts_nested_attributes_for :disks, allow_destroy: true

	has_many :favorites, dependent: :destroy
	has_many :favorited_customers, through: :favorites, source: :customer
	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end

	has_many :carts, dependent: :destroy
	has_many :carted_customers, through: :favorites, source: :customer
	def carted_by?(customer)
		carts.where(customer_id: customer.id).exists?
	end

	has_many :order_details, dependent: :destroy
	def order_detailed_by?(customer)
		order_details.where(customer_id: customer.id).exists?
	end

	attachment :image

	validates :name, presence: true
	validates :price, numericality: { only_interger: true }

	enum status:{
    受付: 0,
    商品準備中: 1,
    出荷済み: 2
  }

   enum sale:{
   	sale: 0,
   	販売停止中: 1,
   	好評発売中: 2
   }

end
