FactoryBot.define do
  factory :user do
    email { |n| "test-#{n.to_s.rjust(3,"0")}@email.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
