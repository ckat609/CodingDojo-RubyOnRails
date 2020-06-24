class AddFieldsToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :money, :integer
    add_column :users, :reason, :string
    add_column :users, :description, :text
    add_column :users, :user_type, :string
  end
  
end
