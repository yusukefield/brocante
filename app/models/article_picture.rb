class ArticlePicture < ApplicationRecord
	belongs_to :article
	attachment :picture
end
