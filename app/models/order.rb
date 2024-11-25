class Order < ApplicationRecord
  belongs_to :user                       # La commande appartient à un utilisateur.
  has_many :order_items                  # Les items de la commande.
  has_many :articles, through: :order_items # Les articles de la commande via order_items.
end
