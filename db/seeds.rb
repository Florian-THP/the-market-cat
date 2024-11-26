# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clean the database
User.destroy_all
Article.destroy_all
Cart.destroy_all
CartItem.destroy_all
Order.destroy_all
OrderItem.destroy_all

puts "Database cleaned!"

# Create administrators
puts "Creating administrators..."
admin_emails = [
  "alexemarichal@hotmail.fr",
  "p.moulin.95@gmail.com",
  "triboutflorian@gmail.com",
  "linepro.olivier@gmail.com",
  "jamesbarthee@gmail.com"
]

admin_emails.each do |email|
  User.create!(
    email: email,
    password: "password123",
    is_admin: true
  )
end
puts "#{admin_emails.size} administrators created!"

# Create regular users
puts "Creating regular users..."
10.times do 
  User.create!(
    email: Faker::Internet.unique.email(domain: "example.fr"),
    password: "password123",
    is_admin: false
  )
end
puts "10 regular users created!"

# Create articles (photos of cats)
puts "Creating articles..."
30.times do 
  cat_name = Faker::Creature::Cat.name
  cat_breed = Faker::Creature::Cat.breed
  cat_characteristic = Faker::Creature::Cat.registry
  description = "A magnificent #{cat_breed} cat, known for its #{cat_characteristic.downcase}. #{cat_name} is ready to capture your heart through this unique photo."

  Article.create!(
    name: "Photo of #{cat_name}",
    description: description,
    price: Faker::Commerce.price(range: 5.0..30.0)
  )
end
puts "30 articles created!"

# Create past orders
puts "Creating past orders..."
10.times do 
  user = User.where(is_admin: false).sample
  order = Order.create!(
    user_id: user.id,
    total_price: 0,
    status: "paid",
    stripe_customer_id: Faker::Number.unique.number(digits: 10)
  )
  # Add items to the order
  2.upto(5).to_a.sample.times do
    article = Article.all.sample
    quantity = 1
    price = article.price
    order.order_items.create!(
      article_id: article.id,
      quantity: quantity,
      price: price
    )
    order.total_price += price * quantity
  end
  order.save!
end
puts "10 past orders created!"

# Create active carts
puts "Creating active carts..."
5.times do
  user = User.where(is_admin: false).sample
  cart = Cart.create!(
    user_id: user.id
  )
  # Add items to the cart
  2.upto(5).to_a.sample.times do
    article = Article.all.sample
    quantity = 1
    cart.cart_items.create!(
      article_id: article.id,
      quantity: quantity
    )
  end
end
puts "5 active carts created!"

puts "Seed successfully completed!"

