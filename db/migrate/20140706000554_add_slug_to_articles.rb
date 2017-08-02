class AddSlugToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :slug, :string
    add_index :articles, :slug
  end
end
