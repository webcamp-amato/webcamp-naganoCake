class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
  enum status: [ :waiting, :confirm, :making, :preparing, :shipped]

end

