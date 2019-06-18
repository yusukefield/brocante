class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.date :date
      t.string :title
      t.text :body
      t.string :country
      t.string :category
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.integer :like_count

      t.timestamps
    end
  end
end
