class ArticlesController < ApplicationController
    def index
      @articles = Article.page(params[:page]).per(6)
    end

    def show
      @article = Article.find_by!(slug: params[:id]) || Article.find(params[:id]) # Recherche par slug mais si aucun slug match, il cherche par id.
    end

end
  