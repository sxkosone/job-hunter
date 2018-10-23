require 'faker'
I18n.reload! #trying to fix faker gem dependency, which causes errors


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.destroy_all
Event.destroy_all
JobApplication.destroy_all
User.destroy_all
Job.destroy_all

#matt = User.create(name: "Matthew Smith", profession: "Programmer", city: "Washington, DC", username: "matty", password: "password")

10.times do
    new_name = Faker::Name.unique.name
    new_username = new_name.downcase.gsub(/\s+/,"") + "123"
    User.create(
        name: new_name, 
        profession: Faker::Job.title, 
        city: Faker::Address.city, 
        username: new_username, 
        password: "password")
end

10.times do 
    Job.create(
        position: Faker::Job.title, 
        city: Faker::Address.city, 
        description: Faker::Company.bs, 
        company: Faker::Company.name, 
        posted_date: Faker::Date.between(1.month.ago, Date.today))
end