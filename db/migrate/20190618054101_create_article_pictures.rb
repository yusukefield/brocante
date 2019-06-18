class CreateArticlePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :article_pictures do |t|
      t.integer :article_id
      t.string :picture_id

      t.timestamps
    end
  end
end
