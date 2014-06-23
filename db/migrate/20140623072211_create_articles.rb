class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :markdown
      t.text :html
      t.datetime :published

      t.timestamps
    end
  end
end
