# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#attendance_list.each do |user_id, event_id|
#  Attendance.create(users_id: user_id, events_id: event_id)
#end



user = User.new
user.email = 'master@master.com'
user.password = 'password'
user.password_confirmation = 'password'
user.role = 0
user.user_info = UserInfo.new
user.user_info.first_name = 'master'
user.user_info.last_name = 'master'
user.user_info.member_status = 0

user.save!

user2 = User.new
user2.email = 'test@test.com'
user2.password = 'csce431'
user2.password_confirmation = 'csce431'
user2.role = 2
user2.user_info = UserInfo.new
user2.user_info.first_name = 'test'
user2.user_info.last_name = 'user'
user2.user_info.member_status = 0

user2.save!


p "Seeded Database"
