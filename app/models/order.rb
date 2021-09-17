class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum payment_method: [ :クレジットカード, :銀行振込]
  enum status: [ :waiting, :confirm, :making, :preparing, :shipped]
  

  
  
end

