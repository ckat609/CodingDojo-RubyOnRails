class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :first_name
      t.string :last_name
      t.string :favorite_language
      t.string :references
      t.references :dojo_location, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
