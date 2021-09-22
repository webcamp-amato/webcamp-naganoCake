class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  belongs_to :genre
  has_many :order_items
  validates :name, length: {minimum: 1, maximum: 15}
  validates :description, length: {minimum: 1, maximum: 255}
  validates :price, presence: true
  validates :genre_id, presence: true

  def self.search_for(value)
    Item.where('name LIKE ?', '%' + value + '%')
  end
end
