class AddCountToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :join_count, :integer
  end
end
