class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum payment_method: [ :credit, :bank]
  enum status: [ :waiting, :confirm, :making, :preparing, :shipped]
end
