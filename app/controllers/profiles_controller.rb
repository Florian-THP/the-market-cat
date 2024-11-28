class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    puts "#{params}"
    if params[:id].to_i == current_user.id
      @user = current_user

      @orders = @user.orders
    else
      redirect_to root_path, alert: "Accès non autorisé."
    end
  end
end


