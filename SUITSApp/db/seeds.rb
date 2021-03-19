# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
events_list =[
  ["test", "This is test", "02/01/2000"]
]

attendance_list = [
  [1, 1]
]

events_list.each do |name, desc, date|
  #Event.create(event_name: name, event_description: desc, date: date)
  event = Event.find(1)
  user = User.find(1)
  a = Attendance.create(users_id: user.id, events_id: event.id )
  p a.users_id
end

#attendance_list.each do |user_id, event_id|
#  Attendance.create(users_id: user_id, events_id: event_id)
#end

p "Seeded Database"
