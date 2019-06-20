class ChangeArticlesOfLikeCount < ActiveRecord::Migration[5.2]
  def change
  	def up
  	change_column :articles, :like_count, :integer, default: 0
  end

  def down
  	change_column :articles, :like_count, :integer
  end
  end
end
