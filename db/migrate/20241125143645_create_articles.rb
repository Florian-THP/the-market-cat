class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
