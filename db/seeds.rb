# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.create(name: "Admin",
                    description: "Can perform any CRUD operation on any resources")
role_mod = Role.create(name: "Moderator",
                        description: "Can delete questions.")
role_member = Role.create(name: "Member",
                          description: "Can create questions. Can create and edit his/her own answers. Can vote to other users' answers.")

(1..3).each do |i|
  user = User.create(username: "user#{i}",
                      email: "user#{i}@cs474.com",
                      password: "12345678",
                      password_confirmation: "12345678")
  user.save!
end

user = UserRole.create(user_id: 1, role_id: 1)
user = UserRole.create(user_id: 1, role_id: 2)
