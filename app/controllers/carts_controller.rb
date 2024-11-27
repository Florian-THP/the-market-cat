class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
    @cart_items = @cart.cart_items.includes(:article)
  end

  def add_article_to_cart
    article = Article.find(params[:article_id])  # Récupérer l'article par son ID
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_create_by(article: article)
    @cart_item.increment(:quantity)  # Ajouter 1 à la quantité
    @cart_item.save
  
    redirect_to cart_path, notice: "L'article a été ajouté au panier."
  end
  

  def remove_article_from_cart
    article = Article.find(params[:article_id])  # Récupère l'article par son ID
    @cart = current_user.cart
    cart_item = @cart.cart_items.find_by(article: article)

    if cart_item
      if cart_item.quantity > 1
        cart_item.decrement(:quantity)  # Décrémente la quantité
        cart_item.save
        flash[:notice] = "La quantité de l'article a été réduite."
      else
        cart_item.destroy  # Si la quantité est 1, on supprime l'article du panier
        flash[:notice] = "L'article a été supprimé du panier."
      end
    else
      flash[:alert] = "Cet article n'est pas dans votre panier."
    end

    redirect_to cart_path
  end

  def clear_cart
    @cart = current_user.cart
    @cart.cart_items.destroy_all  # Supprime tous les articles du panier
    flash[:notice] = "Votre panier a été vidé."
    redirect_to cart_path
  end
end
