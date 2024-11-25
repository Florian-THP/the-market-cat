class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles                     # Articles vendus par le User.
  has_one :cart                          # Chaque User a un Panier.
  has_many :cart_items, through: :cart   # Les items dans le panier via le Cart.
  has_many :orders                       # Les commandes passées par le User.
  has_many :order_items, through: :orders # Les items des commandes via les Orders.
  has_many :purchased_articles, through: :order_items, source: :article # Articles achetés.

end
