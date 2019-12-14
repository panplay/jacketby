class Address < ApplicationRecord

	belong_to :customer

	validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :address, presence: true
end
