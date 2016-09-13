class CreateBans < ActiveRecord::Migration[5.0]
  def change
    create_table :bans do |t|
      t.references :user, foreign_key: true
      t.string :email
      t.text :reason

      t.timestamps
    end
  end
end
