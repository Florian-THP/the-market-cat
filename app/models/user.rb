class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  has_one :cart                           # Chaque utilisateur a un seul panier actif
  has_many :cart_items, through: :cart    # Accès aux items du panier via le panier
  has_many :articles, through: :cart_items, source: :article  # Accès direct aux articles dans le panier
  has_many :orders                        # Un utilisateur peut avoir plusieurs commandes
  has_many :order_items, through: :orders # Accès aux items des commandes via les commandes
  has_many :purchased_articles, through: :order_items, source: :article # Accès direct aux articles achetés via les items des commandes


  scope :admins, -> { where(is_admin: true) }
  
end
