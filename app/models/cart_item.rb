class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :count, length: {minimum: 1}
end
