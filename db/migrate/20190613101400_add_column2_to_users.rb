class AddColumn2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :image_id, :string
    add_column :users, :admin_flg, :integer
    add_column :users, :deleted_at, :datetime
  end
end
