# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
grades = ['bronze']*10+['silver']*8+['gold']*5+['sapphire']*3+['emerald']*2+['diamond']*1
genders = ['male', 'female']
1000.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    grade: grades.sample,
    university: Faker::University.name,
    gender: genders.sample,
    birthday: Faker::Time.between(DateTime.now - 50.years, DateTime.now - 20.years),
    performance: Faker::Number.between(10, 1000),
    married: Faker::Boolean.boolean(0.3)
  )
end
