# frozen_string_literal: true

class DeliveryPlace < ApplicationRecord
  # アソシエーション
  belongs_to :customer

  # バリデーション
  validates :addressee, length: { minimum: 1, maximum: 15 }
  validates :postcode, presence: true, length: { is: 7 }
  validates :address, length: { minimum: 1, maximum: 100 }

  def full_place
    '〒' + postcode + address + addressee
  end
end
