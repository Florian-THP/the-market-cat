class UserMailer < ApplicationMailer

  def order_confirmation(user, order)
    @user = user 
    @order = order
    @articles = order.order_items.map(&:article)
    @url = 'http://TheMarketCat.fr' 


    mail(
      to: @user.email,
      subject: "Merci pour votre achat, #{@user.email} !"
    )

  end
end
