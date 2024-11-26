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

Article.create!(
  name: "Montre connectée",
  description: "Une montre connectée avec suivi de la santé et notifications en temps réel.",
  price: 149.99
)

Article.create!(
  name: "Casque audio",
  description: "Un casque sans fil offrant un son de haute qualité et une réduction active du bruit.",
  price: 89.99
)

Article.create!(
  name: "Tapis de yoga",
  description: "Un tapis de yoga antidérapant, parfait pour les séances à domicile ou en studio.",
  price: 25.50
)

Article.create!(
  name: "Sac à dos de randonnée",
  description: "Sac à dos de 30 litres, imperméable et durable, idéal pour les randonnées longues.",
  price: 54.75
)

Article.create!(
  name: "Clavier mécanique",
  description: "Clavier mécanique RGB avec switchs personnalisables pour les gamers.",
  price: 119.99
)

Article.create!(
  name: "Drone compact",
  description: "Un drone compact avec caméra HD, idéal pour capturer des moments uniques.",
  price: 299.00
)

Article.create!(
  name: "Bouilloire électrique",
  description: "Bouilloire rapide en acier inoxydable avec arrêt automatique pour plus de sécurité.",
  price: 34.95
)

Article.create!(
  name: "Lampe de bureau LED",
  description: "Lampe LED réglable avec plusieurs niveaux de luminosité et port USB intégré.",
  price: 39.99
)
