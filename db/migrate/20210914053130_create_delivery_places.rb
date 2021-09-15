class CreateDeliveryPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_places do |t|

      t.integer :customer_id
      t.string :addressee
      t.string :postcode
      t.string :address

      t.timestamps
    end
  end
end
