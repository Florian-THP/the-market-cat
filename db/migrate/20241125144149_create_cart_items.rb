class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :article_id
      t.integer :quantity
      
      t.timestamps
    end
  end
end
