class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :article_id, null: false

      t.timestamps
    end

    add_index :comments, :article_id
  end
end
