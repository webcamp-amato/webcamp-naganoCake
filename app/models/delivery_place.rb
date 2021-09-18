class DeliveryPlace < ApplicationRecord

  #アソシエーション
  belongs_to :customer

  #バリデーション
  validates :addressee, presence: true
  validates :postcode, presence: true, length: { is: 7 }
  validates :address, presence: true
end
