json.extract! review, :id, :restaurant_id, :reviewer_name, :reviewer_email, :review, :created_at, :updated_at
json.url review_url(review, format: :json)
