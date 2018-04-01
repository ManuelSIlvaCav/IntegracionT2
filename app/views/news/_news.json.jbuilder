json.extract! news, :id, :title, :string, :subtitle, :body, :created_at, :updated_at
json.url news_url(news, format: :json)
