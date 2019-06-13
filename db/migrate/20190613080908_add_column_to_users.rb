class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :text
    add_column :users, :webname, :text
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
