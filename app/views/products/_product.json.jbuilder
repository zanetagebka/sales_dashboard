json.extract! product, :id, :name, :purchase_price, :internal_id, :created_at, :updated_at
json.url product_url(product, format: :json)
