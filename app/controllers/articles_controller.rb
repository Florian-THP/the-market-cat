class ArticlesController < ApplicationController
    def index
        @articles = Article.page(params[:page]).per(6)
    end
  
    def show
      @article = Article.find(params[:id])
    end
end
  