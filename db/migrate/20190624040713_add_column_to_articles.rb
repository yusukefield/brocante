class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :main_picture_id, :string
  end
end
