class CreateOrderLists < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lists do |t|
      t.references :price, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :qunatity
      t.integer :discount

      t.timestamps
    end
  end
end
