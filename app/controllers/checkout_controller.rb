class CheckoutController < ApplicationController
  def create
    # Crée la commande avant de rediriger vers Stripe
    order = current_user.orders.create!(
      total_price: params[:total].to_d,
      status: 'Failed payment' # Status initial
    )

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (order.total_price * 100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        }
      ],
      mode: 'payment',
      metadata: {
        order_id: order.id # Passer l'ID de la commande comme métadonnée
      },
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    order_id = @session.metadata.order_id

    order = Order.find(order_id)
    
    # Mettre à jour le statut de la commande
    order.update!(status: 'Successful Payment')

    # Transférer les articles du panier à la commande
    cart = current_user.cart
    cart.cart_items.each do |cart_item|
      order.order_items.create!(
        article: cart_item.article,
        quantity: cart_item.quantity,
        price: cart_item.article.price
      )
    end

    # Vider le panier
    cart.cart_items.destroy_all if cart.present?

    # Rediriger vers l'historique des commandes
    redirect_to root_path, notice: "Paiement réussi et commande validée !"
  end

  def cancel
    redirect_to cart_path, alert: "Paiement annulé."
  end
end