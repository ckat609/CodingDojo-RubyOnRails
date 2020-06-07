class DeleteMoreColumnsInSurvey < ActiveRecord::Migration
  def change
    remove_column :surveys, :dojo_location_id
    remove_column :surveys, :dojo_id
    add_reference :surveys, :dojo, index: true
  end
end