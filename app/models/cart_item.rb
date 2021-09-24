# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :count, presence: true
end
