class ChangeNameOfCommentFieldInCommentsTable < ActiveRecord::Migration
  def change
    rename_column :comments, :comment, :comment_text
  end
end
