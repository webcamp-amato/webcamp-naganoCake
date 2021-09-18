class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
  enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
  def status_str
    {入金待ち: '入金待ち', 入金確認: '入金確認', 製作中: '製作中', 発送準備中: '発送準備中', 発送済み: '発送済み'}[status.to_sym]
  end
end

