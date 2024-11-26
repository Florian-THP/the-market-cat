class CartItem < ApplicationRecord
  belongs_to :cart                       # Chaque item appartient à un panier.
  belongs_to :article                    # Chaque item correspond à un article.
end
