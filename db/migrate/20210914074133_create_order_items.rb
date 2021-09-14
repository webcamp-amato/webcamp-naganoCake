class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.timestamps
      t.integer :order_id
      t.integer :item_id
      t.integer :count
      t.integer :price
      t.integer :status, default: 0
      
    end
  end
end
