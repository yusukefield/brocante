class Article < ApplicationRecord
	belongs_to :user
	has_many :article_pictures, dependent: :destroy
	accepts_attachments_for :article_pictures, attachment: :picture
end
