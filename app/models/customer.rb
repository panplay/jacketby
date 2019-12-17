class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders

  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item
  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end

  has_many :carts, dependent: :destroy



  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :last_name_kana, presence: true
  # validates :first_name_kana, presence: true
  # validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい。" }
  # validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力して下さい。" }
  # validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  # validates :address, presence: true
  # validates :phone_number, { with: /^0\d{1,4}-\d{1,4}-\d{3,4}$/ }
end
