class AddUserIdToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :userid, :int
  end
end
