FactoryBot.define do
  factory :user, class: 'User' do
    email { |n| "test-#{n.to_s.rjust(3,"0")}@email.com" }
    password { '123456' }
    password_confirmation { '123456' }
    user_info
  end
end

FactoryBot.define do
  factory :user_info, class: 'UserInfo' do
    first_name {'john'}
    last_name {'smith'}
    member_status {'new'}
  end
end

FactoryBot.define do
  factory :event, class: 'Event' do
    event_name { 'TestingEvent'}
    location { 'TAMU' }
    date { '03/14/2021'}
    event_descripition {'this is a test event'}
    passcode { '123456' }
  end
end

FactoryBot.define do
  factory :attendance, :parent => :user, :parent => :event, class: 'Attendance' do
    events_id { :events_id }
    events_passcode { :events_passcode }
    users_id { :users_id }
    passcode { :password }
    user
    event

  end
end
