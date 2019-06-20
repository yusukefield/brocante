class ChangeEventsJoinCount < ActiveRecord::Migration[5.2]
  def up
  	change_column :events, :join_count, :integer, default: '0'
  end

  def down
  	change_column :events, :join_count, :integer
  end
end
