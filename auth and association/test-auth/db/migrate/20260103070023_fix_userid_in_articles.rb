class FixUseridInArticles < ActiveRecord::Migration[8.1]
  def change
    # add correct column
    add_column :articles, :user_id, :integer

    # remove wrong column
    remove_column :articles, :userid
  end
end
