class OrderItem < ApplicationRecord
  belongs_to :order                      # L'item appartient à une commande.
  belongs_to :article                    # L'item correspond à un article.
end
