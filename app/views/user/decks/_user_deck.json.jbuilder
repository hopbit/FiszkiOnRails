json.extract! user_deck, :id, :name, :created_at, :updated_at
json.url user_deck_url(user_deck, format: :json)
