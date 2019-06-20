class Article < ApplicationRecord
    belongs_to :user
    has_many :article_pictures, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes, source: :article
    accepts_attachments_for :article_pictures, attachment: :picture
    geocoded_by :address
    after_validation :geocode
    acts_as_taggable
    enum category:{report: 0,item: 1,coodinate: 2}
    # ユーザーが持っているlikeモデルを探す
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
end
