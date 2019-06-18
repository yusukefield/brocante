class ChangeDatatypeCategoryOfArticle < ActiveRecord::Migration[5.2]
  def change
  	change_column :articles, :category, :integer
  end
end
