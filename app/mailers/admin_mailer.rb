class AdminMailer < ApplicationMailer

    def order_send(user, order)
        @user = user 
        @order = order
        @url = 'http://TheMarketCat.fr' 
    
    
        mail(
          to: User.admins.pluck(:email),
          subject: "Nouvel achat par #{@user.email}"
        )
    
      end


end
