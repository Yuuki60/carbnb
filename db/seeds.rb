require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Order.destroy_all
User.destroy_all
Car.destroy_all

test_user = User.create(
  email: 'test@test.com',
  password: '123456'
)


10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'motdepasse',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

users = User.all

Car.create(name: "Lamborghini", description: "super voiture", price_per_day: 10_000, user: users.sample)
Car.create(name: "Clio", description: "plus ou moins super voiture", price_per_day: 800, user: users.sample)
Car.create(name: "Megane", description: "voiture moyenne", price_per_day: 600, user: users.sample)
Car.create(name: "Avantador", description: "voiture comme ci comme ça", price_per_day: 400, user: users.sample)
Car.create(name: "Fiat", description: "voiture si on n'a pas le choix", price_per_day: 200, user: users.sample)

cars = Car.all
10.times do
  Order.create(
    user: users.sample,
    car: cars.sample,
    start_date: Faker::Date.backward,
    end_date: Faker::Date.forward,
    state: rand(0..2)
  )
end
