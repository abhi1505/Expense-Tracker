json.extract! expense, :id, :title, :amount, :user_id, :created_at, :updated_at
json.url expenses_path(expense, format: :json)
