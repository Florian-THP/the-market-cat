class Article < ApplicationRecord
  belongs_to :user                       # Article vendu par un utilisateur.
  has_many :cart_items                   # Articles ajoutés à des paniers.
  has_many :carts, through: :cart_items  # Les paniers contenant cet article.
  has_many :order_items                  # Articles achetés via des commandes.
  has_many :orders, through: :order_items # Commandes ayant cet article.

end
