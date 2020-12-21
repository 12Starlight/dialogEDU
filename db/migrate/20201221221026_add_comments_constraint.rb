class AddCommentsConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :article_id, false
  end
end
