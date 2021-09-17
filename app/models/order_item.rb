class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum status: [:impossible, :waiting, :making, :made]
  enum status: {"着手不可": 0, "制作待ち": 1, "製作中": 2, "制作完了": 3}
end
