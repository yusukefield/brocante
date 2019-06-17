class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :host_id
      t.date :date
      t.string :title
      t.text :body
      t.string :picture_id
      t.integer :prefecture_code
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
