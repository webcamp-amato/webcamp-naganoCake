class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :total_price
      t.integer :payment_method, default: 0
      t.integer :postage
      t.string :addressee
      t.string :postcode
      t.string :address
      t.integer :status, default: 0
      
      
      
    end
  end
end
