require 'faker'
require 'open-uri'

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

lamborghini = Car.new(name: "Lamborghini", description: "super voiture", price_per_day: 10_000, user: users.sample)
clio = Car.new(name: "Clio", description: "plus ou moins super voiture", price_per_day: 800, user: users.sample)
megane = Car.new(name: "Megane", description: "voiture moyenne", price_per_day: 600, user: users.sample)
aventador = Car.new(name: "Avantador", description: "voiture comme ci comme ça", price_per_day: 400, user: users.sample)
fiat = Car.new(name: "Fiat", description: "voiture si on n'a pas le choix", price_per_day: 200, user: users.sample)

lamborghini_img = URI.open("https://cdn.motor1.com/images/mgl/zxQBp4/s3/2024-lamborghini-revuelto-exterior.jpg")
lamborghini.new_image.attach(io: lamborghini_img, filename: "lambo.png", content_type: "image/png")
lamborghini.save

clio_img = URI.open("https://cdn.drivek.com/configurator-imgs/cars/fr/Original/RENAULT/CLIO/42849_HATCHBACK-5-DOORS/renault-clio-front-view.jpg")
clio.new_image.attach(io: clio_img, filename: "clio.png", content_type: "image/png")
clio.save

megane_img = URI.open("https://images.caradisiac.com/logos/3/4/4/9/273449/S8-maxi-fiche-fiabilite-renault-megane-4-un-modele-a-risque-198261.jpg")
megane.new_image.attach(io: megane_img, filename: "megane.png", content_type: "image/png")
megane.save

aventador_img = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/2023_Lamborghini_Aventador_Ultimae.jpg/1200px-2023_Lamborghini_Aventador_Ultimae.jpg")
aventador.new_image.attach(io: aventador_img, filename: "aventador.png", content_type: "image/png")
aventador.save

fiat_img = URI.open("https://images.caradisiac.com/logos-ref/modele/modele--fiat-punto-evo/S8-modele--fiat-punto-evo.jpg")
fiat.new_image.attach(io: fiat_img, filename: "fiat.png", content_type: "image/png")
fiat.save

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
