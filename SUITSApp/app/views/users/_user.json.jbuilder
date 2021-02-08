json.extract! user, :id, :first_name, :last_name, :email, :user_name, :member_satus, :created_at, :updated_at
json.url user_url(user, format: :json)
