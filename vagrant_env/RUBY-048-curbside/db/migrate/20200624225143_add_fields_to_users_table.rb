class AddFieldsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end
end
