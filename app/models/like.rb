class Like < ApplicationRecord
	belongs_to :user
	belongs_to :article
	belongs_to :article, counter_cache: :like_count
	validates :user_id, presence: true
    validates :article_id, presence: true
end
