class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum payment_method: [ :クレジットカード, :銀行振込]
  enum status: [ :waiting, :confirm, :making, :preparing, :shipped]
  
  def add_tax_price
    (self.price * 1.1).round
  end
  
  def subtotal
    (self.add_tax_price * cart_item.count).round
  end
end
