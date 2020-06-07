class CreateRpgs < ActiveRecord::Migration
  def change
    create_table :rpgs do |t|
      t.string :place

      t.timestamps null: false
    end
  end
end
