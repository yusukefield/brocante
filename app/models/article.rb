class Article < ApplicationRecord
    belongs_to :user
    has_many :article_pictures, dependent: :destroy
    accepts_attachments_for :article_pictures, attachment: :picture
    geocoded_by :address
    after_validation :geocode
    acts_as_taggable
    enum category:{report: 0,item: 1,coodinate: 2}
end
