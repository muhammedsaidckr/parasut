json.extract! order, :id, :currency_type, :gross_amount, :discount_amount, :net_amount, :category_id, :created_at, :updated_at
json.url order_url(order, format: :json)
