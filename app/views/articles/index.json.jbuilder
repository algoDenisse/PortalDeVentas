json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price, :likes, :description, :state
  json.url article_url(article, format: :json)
end
