  class ApplicationController < ActionController::Base
    # Permet uniquement les navigateurs modernes (si la gem est utilisée, sinon supprime cette ligne)
    allow_browser versions: :modern
  
    # Action de base pour gérer les redirections après connexion
    def after_sign_in_path_for(resource)
      root_path # Remplace par une autre route si nécessaire
    end
  
    # Action de base pour gérer les redirections après inscription
    def after_sign_up_path_for(resource)
      root_path # Remplace par une autre route si nécessaire
    end
  
    
    protect_from_forgery with: :exception
    #La méthode protect_from_forgery est une configuration standard pour sécuriser les formulaires
    # contre les attaques CSRF (Cross-Site Request Forgery).
  
    # Ajoute des méthodes ou des configurations spécifiques si nécessaire
  end
  