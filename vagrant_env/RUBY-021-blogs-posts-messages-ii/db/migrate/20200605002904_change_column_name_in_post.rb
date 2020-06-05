class ChangeColumnNameInPost < ActiveRecord::Migration
  def change
    remove_column :posts, :references
  end
end
