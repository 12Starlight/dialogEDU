class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.integer :author_id, null: false 
      t.text :body

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :author_id
  end
end
