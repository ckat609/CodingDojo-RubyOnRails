class AddReferencesToDishtypes < ActiveRecord::Migration
  def change
    add_reference :dishtypes, :menu, index: true, foreign_key: true
  end
end
