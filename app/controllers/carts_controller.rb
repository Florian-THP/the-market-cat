class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
    @cart_items = @cart.cart_items.includes(:article)

    # Supprimer les cart_items sans article associé
    @cart_items.each do |cart_item|
    cart_item.destroy if cart_item.article.nil?
  end
    
  @order = current_user.orders.last

  end


  def add_article_to_cart
    article = Article.find_by!(slug: params[:article_id])
    quantity = params[:quantity].to_i # Récupère la quantité envoyée
    quantity = 1 if quantity <= 0 # Définit une quantité minimale de 1
  
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_create_by(article: article)
  
    # Ajoute la quantité spécifiée
    @cart_item.increment(:quantity, quantity)
    @cart_item.save
  
    flash[:notice] = "#{quantity} article(s) ajouté(s) au panier."
    redirect_to root_path
  end

 
  
  

  def remove_article_from_cart
    article = Article.find(params[:article_id]) 
    @cart = current_user.cart
    cart_item = @cart.cart_items.find_by(article: article)

    if cart_item
      if cart_item.quantity > 1
        cart_item.decrement(:quantity)
        cart_item.save
        flash[:notice] = "La quantité de l'article a été réduite."
      else
        cart_item.destroy 
        flash[:notice] = "L'article a été supprimé du panier."
      end
    else
      flash[:alert] = "Cet article n'est pas dans votre panier."
    end

    redirect_to cart_path
  end

  def clear_cart
    @cart = current_user.cart
    @cart.cart_items.destroy_all 
    flash[:notice] = "Votre panier a été vidé."
    redirect_to cart_path
  end
end
