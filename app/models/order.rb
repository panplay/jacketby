class Order < ApplicationRecord

	belongs_to :customer

	has_many :order_details, dependent: :destroy
    accepts_nested_attributes_for :order_details, allow_destroy: true
	validates :delivery_name, presence: true
	validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
	validates :destination, presence: true
    validates :payment, presence: true

    enum payment:{
    クレジットカード: 0,
    銀行振込: 1,
    代引き: 2
  }

    enum status:{
    受付: 0,
    商品準備中: 1,
    出荷済み: 2
    }


end

