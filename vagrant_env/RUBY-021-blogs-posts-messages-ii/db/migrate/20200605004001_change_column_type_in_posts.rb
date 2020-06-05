class ChangeColumnTypeInPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user
    add_reference :posts, :user, index: true
  end
end
