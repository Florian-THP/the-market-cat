class Article < ApplicationRecord
  before_save :generate_slug  # Génère un slug avant de sauvegarder
  has_one_attached :avatar

  has_many :cart_items                   # Articles ajoutés à des paniers.
  has_many :carts, through: :cart_items  # Les paniers contenant cet article.
  has_many :order_items                  # Articles achetés via des commandes.
  has_many :orders, through: :order_items # Commandes ayant cet article.

  
  def generate_slug # Génère un slug "mon-titre-d-article" à partir du titre si le slug est vide
    self.slug = name.parameterize if slug.blank? 
  end

  
  def to_param  # Rails utilisera le slug au lieu de l'id dans les URLs
    slug  
  end


end


