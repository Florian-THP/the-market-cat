class RemoveUserIdFromArticles < ActiveRecord::Migration[8.0]
  def change
    remove_column :articles, :user_id, :integer
  end
end
