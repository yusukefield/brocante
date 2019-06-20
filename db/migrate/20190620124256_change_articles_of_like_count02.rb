class ChangeArticlesOfLikeCount02 < ActiveRecord::Migration[5.2]
  def up
  	change_column :articles, :like_count, :integer, default: '0'
  end

  def down
  	change_column :articles, :like_count, :integer
  end
end
