class ChangeUsersOfAdminFlg < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :admin_flg, :boolean, default: 'false'
  end

  def down
  	change_column :users, :admin_flg, :boolean
  end
end
