json.extract! micropost, :id, :created_at, :updated_at
json.url micropost_url(micropost, format: :json)
