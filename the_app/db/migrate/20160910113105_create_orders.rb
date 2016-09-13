class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :documnet_id
      t.boolean :finalized

      t.timestamps
    end
  end
end
