json.extract! article, :id, :date, :title, :body, :country, :category, :address, :latitude, :longitude, :user_id, :like_count, :created_at, :updated_at
json.url article_url(article, format: :json)
