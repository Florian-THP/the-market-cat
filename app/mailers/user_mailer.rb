class UserMailer < ApplicationMailer

  def order_confirmation(user, order)
    @user = user
    @order = order
    @articles = order.order_items.map(&:article) # Liste des articles associés à la commande
    @url = 'http://TheMarketCat.fr'

    @articles.each do |article|
      if article.avatar.attached?
        attachments.inline["#{article.name}_avatar.jpg"] = article.avatar.download
      end
    end

    # Envoi du mail
    mail(
      to: @user.email,
      subject: "Merci pour votre achat, #{@user.email} !"
    )
  end
end
