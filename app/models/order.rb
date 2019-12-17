class Order < ApplicationRecord

	belongs_to :customer

	has_many :order_details, dependent: :destroy

	validates :delivery_name, presence: true
	validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
	validates :destination, presence: true

    enum payment:{
    クレジットカード: 0,
    銀行振込: 1,
    代引き: 2
  }
end
