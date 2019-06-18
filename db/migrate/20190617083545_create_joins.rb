class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.integer :user_id
      t.string :event_id
      t.index [:user_id, :event_id], unique: true #複数回いいねすることを防ぎ

      t.timestamps
    end
  end
end
