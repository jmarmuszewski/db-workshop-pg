class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    change_table :order_lists do |t|
      t.rename :qunatity, :quantity
    end
    change_table :orders do |t|
      t.rename :documnet_id, :document_name
    end
  end
end
