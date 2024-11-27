class UserMailer < ApplicationMailer


  def order_confirmation(user, order)
    
    @user = user 
    @order = order

    @articles = order.order_items.map(&:article)

    @articles.each do |article|
        attachments[article.image.filename.to_s] = File.read(article.image.path)
      end

    
    @url  = 'http://TheMarketCat.fr' 


    mail(
      to: @user.email,
      subject: "🐾 Merci pour votre achat, #{@user.name} !"
    )

  end


end
