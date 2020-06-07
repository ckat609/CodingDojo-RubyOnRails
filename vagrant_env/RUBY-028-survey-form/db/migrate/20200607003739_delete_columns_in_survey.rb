class DeleteColumnsInSurvey < ActiveRecord::Migration
  def change
    remove_column :surveys, :favorite_language
    remove_column :surveys, :references
    add_reference :surveys, :language, index: true
  end
end
