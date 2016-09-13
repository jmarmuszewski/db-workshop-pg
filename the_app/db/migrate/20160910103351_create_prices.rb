class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.references :product, foreign_key: true
      t.integer :price_pln

      t.timestamps
    end
  end
end
