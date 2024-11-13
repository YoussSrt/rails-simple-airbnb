# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'

# On crée 4 appartements
10.times do
  Flat.create!(
    name: Faker::Address.community,  # Utilisation de Faker pour générer un nom
    address: Faker::Address.full_address,  # Adresse aléatoire
    description: Faker::Lorem.sentence(word_count: 15),  # Description aléatoire
    price_per_night: Faker::Number.between(from: 50, to: 300),  # Prix entre 50 et 300
    number_of_guests: Faker::Number.between(from: 1, to: 6)  # Nombre d'invités entre 1 et 6
  )
end

puts " 10 flats have been created"
