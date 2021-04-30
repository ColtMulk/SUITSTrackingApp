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


if User.count == 0
  user = User.new
  user.email = 'master@master.com'
  user.password = 'AggieSUITS_2015'
  user.password_confirmation = 'AggieSUITS_2015'
  user.user_info = UserInfo.new
  user.user_info.role = 0
  user.user_info.first_name = 'master'
  user.user_info.last_name = 'master'
  user.user_info.member_status = 0

  user.save!

  user2 = User.new
  user2.email = 'test@test.com'
  user2.password = 'csce431'
  user2.password_confirmation = 'csce431'
  user2.user_info = UserInfo.new
  user2.user_info.role = 2
  user2.user_info.first_name = 'test'
  user2.user_info.last_name = 'user'
  user2.user_info.member_status = 0

  user2.save!
end

if MemberCategory.count == 0
  default_event_types = ["General Meeting", "Goals Meeting", "Service", "Brotherhood", "Social"]
  default_event_type_objects = []

  for event_type in default_event_types do 
    default_event_type = EventType.new
    default_event_type.name = event_type
    default_event_type.save!
    default_event_type_objects.append(default_event_type)
  end

  default_new_cat = MemberCategory.new
  default_new_cat.name = "Ties (default)"
  default_new_cat.default_for = :new
  default_new_cat.save!

  default_old_cat = MemberCategory.new
  default_old_cat.name = "Members (default)"
  default_old_cat.default_for = :old
  default_old_cat.save!

  for event_type in default_event_type_objects do 
    new_cat_ruleset = CategoryRuleset.new
    new_cat_ruleset.points = 1
    new_cat_ruleset.member_category = default_new_cat
    new_cat_ruleset.event_type = event_type
    new_cat_ruleset.save!
    
    old_cat_ruleset = CategoryRuleset.new
    old_cat_ruleset.points = 1
    old_cat_ruleset.member_category = default_old_cat
    old_cat_ruleset.event_type = event_type
    old_cat_ruleset.save!
  end
end

p "Seeded Database"
