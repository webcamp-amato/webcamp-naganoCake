# frozen_string_literal: true

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :cart_items
  has_many :delivery_places
  has_many :orders

  # バリデーション
  validates :last_name, length: { minimum: 1, maximum: 15 }
  validates :first_name, length: { minimum: 1,  maximum: 15 }
  validates :last_name_kana, length: { minimum: 1,  maximum: 15 }
  validates :first_name_kana, length: { minimum: 1, maximum: 15 }
  validates :postcode, presence: true, length: { is: 7 }
  validates :address, length: { minimum: 1, maximum: 100 }
  validates :phone_number, length: { minimum: 1, maximum: 15 }

  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.search_for(value)
    Customer.where(['last_name || first_name LIKE?', '%' + value + '%'])
  end
end
