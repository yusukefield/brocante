class Like < ApplicationRecord
	belongs_to :articles, counter_cache: :like_count
end
