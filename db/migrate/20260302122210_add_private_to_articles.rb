class AddPrivateToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :private, :boolean, default: false
  end
end
