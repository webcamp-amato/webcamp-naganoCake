# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :count, presence: true
  validates :price, presence: true
  validates :item_id, presence: true

  enum status: %i[着手不可 製作待ち 製作中 製作完了]
  def status_str
    { 着手不可: '着手不可', 製作待ち: '製作待ち', 製作中: '制作中', 製作完了: '製作完了' }[status.to_sym]
  end
end
