class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum status: [:impossible, :waiting, :making, :made]
end
