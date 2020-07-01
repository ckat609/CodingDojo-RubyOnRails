class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :dishtype, index: true, foreign_key: true
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
