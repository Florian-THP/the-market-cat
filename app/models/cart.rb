class Cart < ApplicationRecord
  belongs_to :user                       # Le panier appartient à un User.
  has_many :cart_items                   # Les items dans le panier.
  has_many :articles, through: :cart_items # Les articles dans le panier via cart_items.
end
