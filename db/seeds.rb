# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Car.destroy_all

user = User.create!(
  email: 'test@test.com',
  password: '123456'
)
user.confirm

Car.create(name: "Lamborghini", description: "super voiture", price_per_day: 10000, user: user)
Car.create(name: "Clio", description: "plus ou moins super voiture", price_per_day: 800, user: user)
Car.create(name: "Megane", description: "voiture moyenne", price_per_day: 600, user: user)
Car.create(name: "Avantador", description: "voiture comme ci comme ça", price_per_day: 400, user: user)
Car.create(name: "Fiat", description: "voiture si on n'a pas le choix", price_per_day: 200, user: user)
