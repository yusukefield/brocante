json.extract! event, :id, :host_id, :date, :title, :body, :picture_id, :prefecture_code, :address, :latitude, :longitude, :created_at, :updated_at
json.url event_url(event, format: :json)
