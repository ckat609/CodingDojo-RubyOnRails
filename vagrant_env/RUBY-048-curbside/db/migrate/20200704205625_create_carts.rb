class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :order, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
