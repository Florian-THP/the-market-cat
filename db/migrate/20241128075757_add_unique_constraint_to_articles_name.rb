class AddUniqueConstraintToArticlesName < ActiveRecord::Migration[8.0]
  def change
    add_index :articles, :name, unique: true
  end
end
