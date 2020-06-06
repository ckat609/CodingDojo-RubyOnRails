class CreateTimeSaves < ActiveRecord::Migration
  def change
    create_table :time_saves do |t|
      t.datetime :some_time

      t.timestamps null: false
    end
  end
end
