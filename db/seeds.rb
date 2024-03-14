require 'faker'
require 'open-uri'
require 'csv'

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


cars_url = [
  "https://en.wikipedia.org/wiki/Ford_Transit",
  "https://en.wikipedia.org/wiki/Lamborghini_Aventador",
  "https://en.wikipedia.org/wiki/Renault_M%C3%A9gane",
  "https://en.wikipedia.org/wiki/Alfa_Romeo_Giulia_(2015)",
  "https://fr.wikipedia.org/wiki/Peugeot_307",
  "https://en.wikipedia.org/wiki/Chevrolet_Camaro",
  "https://en.wikipedia.org/wiki/Ford_Kuga"
]

cars_url.each do |url|
  html = URI.open(url)
  doc = Nokogiri::HTML.parse(html)

  car = Car.new(
    name: doc.search('.mw-page-title-main').text,
    price_per_day: rand(100..1000),
    user: users.sample
  )

  image_url = "https:#{doc.search('table span a img').attr('src').value}"
  image = URI.open(image_url)
  car.new_image.attach(io: image, filename: "#{car.name}.jpg")

  car.save
end
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
